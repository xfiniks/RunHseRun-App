import RIBs

protocol MainDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.

    var userManager: UserManager { get }
    var friendsManager: FriendsManager { get }
    var streamManager: StreamManager { get }
    var gameManager: GameManager { get }
}

final class MainComponent: Component<MainDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.

    var userManager: UserManager {
        dependency.userManager
    }
    var friendsManager: FriendsManager {
        dependency.friendsManager
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

        let mainScreenViewController = MainScreenViewController()
        let friendsViewController = FriendsViewController()
        let iMessageChatChannelListViewController = iMessageChatChannelListViewController()
        let viewController = MainViewController()
        viewController.friendsViewController = friendsViewController
        viewController.iMessageChatChannelListViewController = iMessageChatChannelListViewController
        viewController.mainScreenViewController = mainScreenViewController

        let interactor = MainInteractor(presenter: viewController,
                                        mainScreenPresenter: mainScreenViewController,
                                        friendsScreenPresentable: friendsViewController,
                                        userManager: component.userManager,
                                        friendsManager: component.friendsManager)
        interactor.listener = listener

        let gameBuilder = GameBuilder(dependency: component)

        return MainRouter(interactor: interactor,
                          viewController: viewController,
                          mainScreenViewController: mainScreenViewController,
                          gameBuilder: gameBuilder)
    }
}
