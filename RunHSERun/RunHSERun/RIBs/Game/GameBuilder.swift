import RIBs

protocol GameDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.

    var streamManager: StreamManager { get }
    var gameManager: GameManager { get }
}

final class GameComponent: Component<GameDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    var streamManager: StreamManager {
        dependency.streamManager
    }

    var gameManager: GameManager {
        dependency.gameManager
    }

}

// MARK: - Builder

protocol GameBuildable: Buildable {
    func build(withListener listener: GameListener) -> GameRouting
}

final class GameBuilder: Builder<GameDependency>, GameBuildable {

    override init(dependency: GameDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: GameListener) -> GameRouting {
        let component = GameComponent(dependency: dependency)
        let gameViewController = GameViewController()
        let chooseStartRoomViewController = ChooseStartRoomViewController()
        let resultsViewController = ResultsViewController()
        let waitingScreenViewController = WaitingScreenViewController()
        let interactor = GameInteractor(presenter: chooseStartRoomViewController,
                                        waitingScreenPresenter: waitingScreenViewController,
                                        gameScreenPresenter: gameViewController,
                                        resultsPresenter: resultsViewController,
                                        streamManager: component.streamManager,
                                        gameManager: component.gameManager)
        interactor.listener = listener
        return GameRouter(interactor: interactor,
                          viewController: chooseStartRoomViewController,
                          gameViewController: gameViewController,
                          waitingScreenViewController: waitingScreenViewController,
                          resultsViewController: resultsViewController)
    }
}
