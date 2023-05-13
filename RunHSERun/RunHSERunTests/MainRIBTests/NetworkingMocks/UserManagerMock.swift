@testable import RunHSERun
import GRPC

final class UserManagerMock: UserManager {

    var error: Error?

    func makeChangeImageRequest(newImage: String, completion: @escaping (VoidResult) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else {
            completion(.success)
        }
    }

    func makeGetMeRequest(completion: @escaping (Result<User, Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else {
            completion(.success(User.default))
        }
    }

    func makeChangeNicknameRequest(nickname: String, completion: @escaping (VoidResult) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else {
            completion(.success)
        }
    }

    func makeGetLeaderboardRequest(completion: @escaping (Result<[User], Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else {
            completion(.success([User.default]))
        }
    }

    func makeGetUserByIdRequest(id: Int, completion: @escaping (Result<User, Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else {
            completion(.success(User.default))
        }
    }

    func makeGetUserByNicknameRequest(nickname: String, completion: @escaping (Result<[User], Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else {
            completion(.success([User.default]))
        }
    }

}
