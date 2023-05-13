protocol FriendsManager {

    func makeAddFriendRequest(userId: Int, completion: @escaping (VoidResult) -> Void)
    func makeDeleteFriendRequest(userId: Int, completion: @escaping (VoidResult) -> Void)
    func makeGetFriendsRequest(completion: @escaping (Result<Run_Hse_Run_Users, Error>) -> Void)

}

final class FriendsManagerImpl: FriendsManager {

    private let friendsService: FriendsService
    private let secureSettingsKeeper: SecureSettingsKeeper

    init(friendsService: FriendsService, secureSettingsKeeper: SecureSettingsKeeper) {
        self.friendsService = friendsService
        self.secureSettingsKeeper = secureSettingsKeeper
    }

    func makeAddFriendRequest(userId: Int, completion: @escaping (VoidResult) -> Void) {
        guard let token = secureSettingsKeeper.authToken else {
            completion(.failure(TokenError.tokenIsNil))
            return
        }

        var req = Run_Hse_Run_AddFriendRequest()
        req.userID = Int64(userId)

        friendsService.makeAddFriendRequest(with: req, token: token) { result in
            switch result {
            case .success:
                completion(.success)

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func makeDeleteFriendRequest(userId: Int, completion: @escaping (VoidResult) -> Void) {
        guard let token = secureSettingsKeeper.authToken else {
            completion(.failure(TokenError.tokenIsNil))
            return
        }

        var req = Run_Hse_Run_DeleteFriendRequest()
        req.userID = Int64(userId)

        friendsService.makeDeleteFriendRequest(with: req, token: token) { result in
            switch result {
            case .success:
                completion(.success)

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func makeGetFriendsRequest(completion: @escaping (Result<Run_Hse_Run_Users, Error>) -> Void) {
        guard let token = secureSettingsKeeper.authToken else {
            completion(.failure(TokenError.tokenIsNil))
            return
        }

        friendsService.makeGetFriendsRequest(token: token) { result in
            switch result {
            case .success(let users):
                completion(.success(users))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
