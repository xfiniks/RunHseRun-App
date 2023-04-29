import RIBs

protocol GameInteractable: Interactable {
    var router: GameRouting? { get set }
    var listener: GameListener? { get set }
}

protocol GameViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func replaceModal(viewController: ViewControllable?)
}

protocol ChooseStartRoomViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func replaceModal(viewController: ViewControllable?)
}

protocol WaitingScreenViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func replaceModal(viewController: ViewControllable?)
}

protocol ResultsViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func replaceModal(viewController: ViewControllable?)
}

final class GameRouter: ViewableRouter<GameInteractable, ChooseStartRoomViewControllable>, GameRouting {

    private let gameViewController: GameViewControllable
    private let waitingScreenViewController: WaitingScreenViewControllable
    private let resultsViewController: ResultsViewControllable

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: GameInteractable,
         viewController: ChooseStartRoomViewControllable,
         gameViewController: GameViewControllable,
         waitingScreenViewController: WaitingScreenViewControllable,
         resultsViewController: ResultsViewControllable) {
        self.gameViewController = gameViewController
        self.waitingScreenViewController = waitingScreenViewController
        self.resultsViewController = resultsViewController
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    func moveToWaiting() {
        viewController.replaceModal(viewController: waitingScreenViewController)
    }

    func moveToGame() {
        viewController.replaceModal(viewController: gameViewController)
    }

    func moveToResults() {
        viewController.replaceModal(viewController: resultsViewController)
    }

}
