import RIBs

protocol RootInteractable: Interactable, AuthorizationListener {
    var router: RootRouting? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func replaceModal(viewController: ViewControllable?)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable> {

    private let authorizationBuilder: AuthorizationBuilder

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         authorizationBuilder: AuthorizationBuilder) {
        self.authorizationBuilder = authorizationBuilder

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

}
