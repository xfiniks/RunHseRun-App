final class UserManager {

    private let userService: UserService
    private let secureSettingsKeeper: SecureSettingsKeeper

    init(userService: UserService, secureSettingsKeeper: SecureSettingsKeeper) {
        self.userService = userService
        self.secureSettingsKeeper = secureSettingsKeeper
    }

    func makeChangeImageRequest(newImage: String, completion: @escaping (VoidResult) -> Void) {
        guard let token = secureSettingsKeeper.authToken else {
            completion(.failure(TokenError.tokenIsNil))
            return
        }

        var req = Run_Hse_Run_ChangeImageRequest()
        req.newImage = newImage

        userService.makeChangeImageRequest(with: req, token: token) { result in
            switch result {
            case .success:
                completion(.success)

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func makeGetMeRequest(completion: @escaping (Result<User, Error>) -> Void) {
        guard let token = secureSettingsKeeper.authToken else {
            completion(.failure(TokenError.tokenIsNil))
            return
        }
        
        userService.makeGetMeRequest(token: token) { result in
            switch result {
            case .success(let user):
                completion(.success(User(networkUser: user)))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func makeChangeNicknameRequest(nickname: String, completion: @escaping (VoidResult) -> Void) {
        guard let token = secureSettingsKeeper.authToken else {
            completion(.failure(TokenError.tokenIsNil))
            return
        }

        var req = Run_Hse_Run_ChangeNicknameRequest()
        req.newNickname = nickname

        userService.makeChangeNicknameRequest(with: req, token: token) { result in
            switch result {
            case .success:
                completion(.success)

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func makeGetLeaderboardRequest(completion: @escaping (Result<[User], Error>) -> Void) {
        guard let token = secureSettingsKeeper.authToken else {
            completion(.failure(TokenError.tokenIsNil))
            return
        }

        userService.makeGetLeaderboardRequest(token: token) { result in
            switch result {
            case .success(let response):
                let users = response.users.map { user in
                    User(networkUser: user)
                }
                completion(.success(users))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func makeGetUserByIdRequest(id: Int, completion: @escaping (Result<User, Error>) -> Void) {
        guard let token = secureSettingsKeeper.authToken else {
            completion(.failure(TokenError.tokenIsNil))
            return
        }

        var req = Run_Hse_Run_GetUserByIDRequest()
        req.id = Int64(id)

        userService.makeGetUserByIdRequest(with: req, token: token) { result in
            switch result {
            case .success(let user):
                completion(.success(User(networkUser: user)))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func makeGetUserByNicknameRequest(nickname: String, completion: @escaping (Result<[User], Error>) -> Void) {
        guard let token = secureSettingsKeeper.authToken else {
            completion(.failure(TokenError.tokenIsNil))
            return
        }

        var req = Run_Hse_Run_GetUserByNicknameRequest()
        req.nickname = nickname

        userService.makeGetUserByNicknameRequest(with: req, token: token) { result in
            switch result {
            case .success(let users):
                let users = users.users.map { user in
                    User(networkUser: user)
                }
                completion(.success(users))

            case .failure(let error):
                completion(.failure(error))
            }
        }

    }

}
