import RIBs

protocol MainDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.

    var userManager: UserManager { get }
    var userDataKeeper: UserDataKeeper { get }
}

final class MainComponent: Component<MainDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.

    var userManager: UserManager {
        dependency.userManager
    }
    var userDataKeeper: UserDataKeeper {
        dependency.userDataKeeper
    }
}

// MARK: - Builder

protocol MainBuildable: Buildable {
    func build(withListener listener: MainListener) -> MainRouting
}

final class MainBuilder: Builder<MainDependency>, MainBuildable {

    override init(dependency: MainDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: MainListener) -> MainRouting {
        let component = MainComponent(dependency: dependency)
        let viewController = MainViewController()
        let mainScreenViewController = MainScreenViewController()
        let interactor = MainInteractor(presenter: viewController,
                                        mainScreenPresenter: mainScreenViewController,
                                        userManager: component.userManager,
                                        userDataKeeper: component.userDataKeeper)
        interactor.listener = listener
        return MainRouter(interactor: interactor, viewController: viewController)
    }
}
