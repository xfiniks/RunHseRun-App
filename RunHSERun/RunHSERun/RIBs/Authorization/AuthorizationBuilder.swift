import RIBs

protocol AuthorizationDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
    var authManager: AuthManager { get }
}

final class AuthorizationComponent: Component<AuthorizationDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    fileprivate var authManager: AuthManager {
        dependency.authManager
    }
}

// MARK: - Builder

protocol AuthorizationBuildable: Buildable {
    func build(withListener listener: AuthorizationListener) -> AuthorizationRouting
}

final class AuthorizationBuilder: Builder<AuthorizationDependency>, AuthorizationBuildable {

    override init(dependency: AuthorizationDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: AuthorizationListener) -> AuthorizationRouting {
        let component = AuthorizationComponent(dependency: dependency)
        let registrationViewController = RegistrationViewController()
        let otpViewController = OTPViewController()
        let nicknameChoosingViewController = NicknameChoosingViewController()
        let interactor = AuthorizationInteractor(registrationPresenter: registrationViewController,
                                                 OTPPresenter: otpViewController,
                                                 nicknameChoosingPresenter: nicknameChoosingViewController,
                                                 authManager: component.authManager)
        interactor.listener = listener
        return AuthorizationRouter(interactor: interactor,
                                   registrationViewController: registrationViewController,
                                   OTPViewController: otpViewController,
                                   nicknameChoosingViewController: nicknameChoosingViewController)
    }
}
