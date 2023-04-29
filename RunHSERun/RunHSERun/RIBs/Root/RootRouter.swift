import RIBs

protocol RootInteractable: Interactable, AuthorizationListener, MainListener {
    var router: RootRouting? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func replaceModal(viewController: ViewControllable?)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable> {

    private let authorizationBuilder: AuthorizationBuildable
    private let mainBuilder: MainBuildable

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         authorizationBuilder: AuthorizationBuildable,
         mainBuiler: MainBuildable) {
        self.authorizationBuilder = authorizationBuilder
        self.mainBuilder = mainBuiler

        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }


}

extension RootRouter: RootRouting {

    func moveToRegistration() {
        let authorization = authorizationBuilder.build(withListener: interactor)
        attachChild(authorization)
        viewController.replaceModal(viewController: authorization.viewControllable)
    }

    func moveToMainScreen() {
        let main = mainBuilder.build(withListener: interactor)
        attachChild(main)
        viewController.replaceModal(viewController: main.viewControllable)
    }

}
