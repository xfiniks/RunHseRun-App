import RIBs

protocol MainInteractable: Interactable, GameListener {
    var router: MainRouting? { get set }
    var listener: MainListener? { get set }
}

protocol MainViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

protocol MainScreenViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func replaceModal(viewController: ViewControllable?)
    
}

final class MainRouter: ViewableRouter<MainInteractable, MainViewControllable>, MainRouting {

    private let gameBuilder: GameBuildable
    private let mainScreenViewController: MainScreenViewControllable

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: MainInteractable,
         viewController: MainViewControllable,
         mainScreenViewController: MainScreenViewController,
         gameBuilder: GameBuildable) {
        self.gameBuilder = gameBuilder
        self.mainScreenViewController = mainScreenViewController
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    func attachGameRIB() {
        let game = gameBuilder.build(withListener: interactor)
        attachChild(game)
        mainScreenViewController.replaceModal(viewController: game.viewControllable)
    }
    
}
