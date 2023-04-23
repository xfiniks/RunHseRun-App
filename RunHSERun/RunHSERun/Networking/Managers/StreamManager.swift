protocol StreamObserver: AnyObject {

    func processGameInfo(info: GameInfo)
    func processGameResults(results: String)
    func processError(error: Error)

}

final class StreamManager {

    private typealias Observer = StreamObserver

    private let stream: GRPCStream
    private let secureSettingsKeeper: SecureSettingsKeeper

    private var observers = ObserversCollection<Observer>()

    init(stream: GRPCStream, secureSettingsKeeper: SecureSettingsKeeper) {
        self.stream = stream
        self.secureSettingsKeeper = secureSettingsKeeper
    }

    func startGame() {
        guard let token = secureSettingsKeeper.authToken else {
            self.observers.notify { $0.processError(error: TokenError.tokenIsNil) }
            return
        }

        stream.startGame(token: token) { [weak self] result in
            switch result {
            case .success(let response):
                switch response {
                case .gameInfo(let info):
                    self?.observers.notify { $0.processGameInfo(info: GameInfo(info)) }

                case .gameResult(let result):
                    self?.observers.notify { $0.processGameResults(results: result) }
                }

            case .failure(let error):
                self?.observers.notify { $0.processError(error: error) }
            }
        }
    }

}
