final class StreamManager {

    private let stream: GRPCStream
    private let secureSettingsKeeper: SecureSettingsKeeper

    init(stream: GRPCStream, secureSettingsKeeper: SecureSettingsKeeper) {
        self.stream = stream
        self.secureSettingsKeeper = secureSettingsKeeper
    }

    func startGame(completion: @escaping (Result<StreamResponse, Error>) -> Void) {
        guard let token = secureSettingsKeeper.authToken else {
            completion(.failure(TokenError.tokenIsNil))
            return
        }

        stream.startGame(token: token) { result in
            switch result {
            case .success(let response):
                completion(.success(response))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}




