@testable import RunHSERun
import GRPC

final class AuthManagerMock: AuthManager {

    var error: Error?
    var authVerifyResponse: AuthVerifyResponse?
    var authRegisterResponse: AuthRegisterResponse?

    func makeSendVerifyEmailRequest(with email: String, completion: @escaping (VoidResult) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else {
            completion(.success)
        }
    }

    func makeVerifyRequest(with code: Int, completion: @escaping (Result<AuthVerifyResponse, Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else {
            completion(.success(authVerifyResponse!))
        }
    }

    func makeRegistrationRequest(with nickname: String, completion: @escaping (Result<AuthRegisterResponse, Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else {
            completion(.success(authRegisterResponse!))
        }
    }

}
