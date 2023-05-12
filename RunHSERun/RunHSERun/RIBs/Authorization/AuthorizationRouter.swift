import RIBs

protocol AuthorizationInteractable: Interactable {
    var router: AuthorizationRouting? { get set }
    var listener: AuthorizationListener? { get set }
}

protocol AuthorizationViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func replaceModal(viewController: ViewControllable?)
}

final class AuthorizationRouter: ViewableRouter<AuthorizationInteractable, AuthorizationViewControllable> {

    private let registrationViewController: AuthorizationViewControllable
    private let OTPViewController: AuthorizationViewControllable
    private let nicknameChoosingViewController: AuthorizationViewControllable

    private var currentViewController: AuthorizationViewControllable

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: AuthorizationInteractable,
         registrationViewController: AuthorizationViewControllable,
         OTPViewController: AuthorizationViewControllable,
         nicknameChoosingViewController: AuthorizationViewControllable) {
        self.registrationViewController = registrationViewController
        self.OTPViewController = OTPViewController
        self.nicknameChoosingViewController = nicknameChoosingViewController
        self.currentViewController = registrationViewController

        super.init(interactor: interactor, viewController: registrationViewController)
        interactor.router = self
    }
}

extension AuthorizationRouter: AuthorizationRouting {

    func moveToOTP() {
        currentViewController.replaceModal(viewController: OTPViewController)
        currentViewController = OTPViewController
    }

    func moveToRegistration() {
        currentViewController.replaceModal(viewController: registrationViewController)
        currentViewController = registrationViewController
    }

    func moveToNicknameChoosing() {
        currentViewController.replaceModal(viewController: nicknameChoosingViewController)
        currentViewController = registrationViewController
    }

}
