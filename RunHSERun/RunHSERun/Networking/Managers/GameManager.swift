protocol GameManager {

    func makePutInQueueRequest(roomId: Int, completion: @escaping (VoidResult) -> Void)
    func makeSendTimeRequest(time: Int, gameId: Int, completion: @escaping (VoidResult) -> Void)
    func makeDeleteFromQueueRequest(token: String, completion: @escaping (VoidResult) -> Void)
    func makeGetRoomsByCodeRequest(code: String,
                                   completion: @escaping (Result<Run_Hse_Run_GetRoomByCodeResponse, Error>) -> Void)
}

final class GameManagerImpl: GameManager {

    private let gameService: GameService
    private let secureSettingsKeeper: SecureSettingsKeeper

    init(gameService: GameService, secureSettingsKeeper: SecureSettingsKeeper) {
        self.gameService = gameService
        self.secureSettingsKeeper = secureSettingsKeeper
    }

    func makePutInQueueRequest(roomId: Int, completion: @escaping (VoidResult) -> Void) {
        guard let token = secureSettingsKeeper.authToken else {
            completion(.failure(TokenError.tokenIsNil))
            return
        }

        var req = Run_Hse_Run_PutInQueueRequest()
        req.roomID = Int64(roomId)

        gameService.makePutInQueueRequest(with: req, token: token) { result in
            switch result {
            case .success:
                completion(.success)

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func makeSendTimeRequest(time: Int, gameId: Int, completion: @escaping (VoidResult) -> Void) {
        guard let token = secureSettingsKeeper.authToken else {
            completion(.failure(TokenError.tokenIsNil))
            return
        }

        var req = Run_Hse_Run_SendTimeRequest()
        req.time = Int64(time)
        req.gameID = Int64(gameId)

        gameService.makeSendTimeRequest(with: req, token: token) { result in
            switch result {
            case .success:
                completion(.success)

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func makeDeleteFromQueueRequest(token: String, completion: @escaping (VoidResult) -> Void) {
        guard let token = secureSettingsKeeper.authToken else {
            completion(.failure(TokenError.tokenIsNil))
            return
        }

        gameService.makeDeleteFromQueueRequest(token: token) { result in
            switch result {
            case .success:
                completion(.success)

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func makeGetRoomsByCodeRequest(code: String,
                                   completion: @escaping (Result<Run_Hse_Run_GetRoomByCodeResponse, Error>) -> Void) {
        guard let token = secureSettingsKeeper.authToken else {
            completion(.failure(TokenError.tokenIsNil))
            return
        }

        var req = Run_Hse_Run_GetRoomByCodeRequest()
        req.code = code

        gameService.makeGetRoomsByCodeRequest(with: req, token: token) { result in
            switch result {
            case .success(let response):
                completion(.success(response))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}


