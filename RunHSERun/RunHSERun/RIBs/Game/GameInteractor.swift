import RIBs
import RxSwift

protocol GameRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func moveToWaiting()
    func moveToGame()
    func moveToResults()
}

protocol GamePresentable: Presentable {
    var listener: GamePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.

    func setViewModel(room: String)
}

protocol ChooseStartRoomScreenPresentable: Presentable {
    var listener: ChooseStartRoomPresentableListener? { get set }

    func setViewModel(rooms: [Room])
}

protocol ResultsScreenPresentable: Presentable {
    var listener: ResultsScreenPresentableListener? { get set }

}

protocol WaitingScreenPresentable: Presentable {
    var listener: WaitingScreenPresentableListener? { get set }

}


protocol GameListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func didFinish()
}

final class GameInteractor: PresentableInteractor<ChooseStartRoomViewController>, GameInteractable {

    weak var router: GameRouting?
    weak var listener: GameListener?

    private var waitingScreenPresenter: WaitingScreenPresentable?
    private var gameScreenPresenter: GamePresentable?
    private var resultsPresenter: ResultsScreenPresentable?
    private var textPredictor: TextPredictor?
    private var streamManager: StreamManager
    private var gameManager: GameManager
    private var rooms: [Room]?
    private var currentStage: Int = 0

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: ChooseStartRoomViewController,
         waitingScreenPresenter: WaitingScreenPresentable,
         gameScreenPresenter: GamePresentable,
         resultsPresenter: ResultsScreenPresentable,
         streamManager: StreamManager,
         gameManager: GameManager) {
        self.waitingScreenPresenter = waitingScreenPresenter
        self.gameScreenPresenter = gameScreenPresenter
        self.resultsPresenter = resultsPresenter
        self.streamManager = streamManager
        self.gameManager = gameManager
        
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }

}

extension GameInteractor: GamePresentableListener {

    func validateImage(image: UIImage) {
        textPredictor?.makeRequest(userImage: image)
    }

}

extension GameInteractor: ChooseStartRoomPresentableListener {

    func handleTapOnRoomButton(id: Int) {
        streamManager.startGame()
        gameManager.makePutInQueueRequest(roomId: id) { [weak self] result in
            switch result {
            case .success:
                self?.router?.moveToWaiting()

            case .failure(let error):
                print(error)
            }
        }
    }

    func handleBackButtonPressed() {
        listener?.didFinish()
    }
    
}

extension GameInteractor: StreamObserver {

    func processGameInfo(info: GameInfo) {
        let roomsLabels = info.rooms.map { $0.code }
        textPredictor = TextPredictor(rooms: roomsLabels) { [weak self] result in
            switch result {
            case .success(let isLastRoom):
                if isLastRoom {
                    self?.router?.moveToWaiting()
                }
                else {
                    guard let self = self, let rooms = self.rooms else {
                        return
                    }

                    self.gameScreenPresenter?.setViewModel(room: rooms[self.currentStage].code)
                    self.currentStage += 1
                }


            case .badRoom:
                print("error")
            }
        }
    }

    func processGameResults(results: String) {
        router?.moveToResults()
    }

    func processError(error: Error) {
        print(error)
    }

}
