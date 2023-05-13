protocol AuthManager {

    func makeSendVerifyEmailRequest(with email: String, completion: @escaping (VoidResult) -> Void)
    func makeVerifyRequest(with code: Int, completion: @escaping (Result<AuthVerifyResponse, Error>) -> Void)
    func makeRegistrationRequest(with nickname: String, completion: @escaping (Result<AuthRegisterResponse, Error>) -> Void)

}

final class AuthManagerImpl: AuthManager {

    private let userDataKeeper: UserDataKeeper
    private let authService: AuthService
    private var secureSettingsKeeper: SecureSettingsKeeper

    init(userDataKeeper: UserDataKeeper, authService: AuthService, secureSettingsKeeper: SecureSettingsKeeper) {
        self.userDataKeeper = userDataKeeper
        self.authService = authService
        self.secureSettingsKeeper = secureSettingsKeeper
    }

    func makeSendVerifyEmailRequest(with email: String, completion: @escaping (VoidResult) -> Void) {
        var req = Run_Hse_Run_SendVerifyEmailRequest()
        req.email = email

        authService.makeSendVerifyEmailRequest(with: req) { [weak self] result in
            switch result {
            case .success:
                self?.userDataKeeper.setUserEmail(email: email)
                completion(.success)

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func makeVerifyRequest(with code: Int, completion: @escaping (Result<AuthVerifyResponse, Error>) -> Void) {
        guard let email = userDataKeeper.getUserEmail() else {
            completion(.failure(RequestError.emptyEmail))
            return
        }

        var req = Run_Hse_Run_VerifyRequest()
        req.email = email
        req.code = Int64(code)

        authService.makeVerifyRequest(with: req) { [weak self] result in
            switch result {
            case .success(let response):
                switch response.response {
                case .needRegistration:
                    completion(.success(.needRegistration))

                case .userInfo(let user):
                    self?.secureSettingsKeeper.authToken = user.accessToken
                    completion(.success(.moveNext))

                case .none:
                    break
                }

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func makeRegistrationRequest(with nickname: String, completion: @escaping (Result<AuthRegisterResponse, Error>) -> Void) {
        guard let email = userDataKeeper.getUserEmail() else {
            completion(.failure(RequestError.emptyEmail))
            return
        }

        var req = Run_Hse_Run_User()
        req.email = email
        req.nickname = nickname

        authService.makeRegistrationRequest(with: req) { [weak self] result in
            switch result {
            case .success(let response):
                self?.secureSettingsKeeper.authToken = response.accessToken
                completion(.success(.moveNext))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
