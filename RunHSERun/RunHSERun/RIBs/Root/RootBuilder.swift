import RIBs

protocol RootDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.

    var secureSettingsKeeper: SecureSettingsKeeper { get }
    var authManager: AuthManager { get }
    var userManager: UserManager { get }
    var friendsManager: FriendsManager { get }
    var userDataKeeper: UserDataKeeper { get }
    var streamManager: StreamManager { get }
    var gameManager: GameManager { get }
}

final class RootComponent: Component<RootDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
    let rootViewController: RootViewController

    fileprivate var secureSettingsKeeper: SecureSettingsKeeper {
        dependency.secureSettingsKeeper
    }

    init(dependency: RootDependency,
         rootViewController: RootViewController) {
        self.rootViewController = rootViewController
        super.init(dependency: dependency)
    }

}

// MARK: - Builder

protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {

    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let viewController = RootViewController()

        let component = RootComponent(dependency: dependency, rootViewController: viewController)
        let interactor = RootInteractor(presenter: viewController,
                                        secureSettingsKeeper: component.secureSettingsKeeper)

        let authorizationBuilder = AuthorizationBuilder(dependency: component)
        let mainBuilder = MainBuilder(dependency: component)

        return RootRouter(interactor: interactor, viewController: viewController, authorizationBuilder: authorizationBuilder, mainBuiler: mainBuilder)
    }
}
