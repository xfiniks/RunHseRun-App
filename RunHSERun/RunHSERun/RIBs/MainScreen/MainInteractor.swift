import RIBs

protocol MainRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func attachGameRIB()
}

protocol MainPresentable: Presentable {
    var listener: MainPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol MainScreenPresentable: Presentable {
    var listener: MainScreenPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.

    func setViewModel(user: User?, leaderboardUsers: [User])
}

protocol FriendsPresentable: Presentable {
    var listener: FriendsPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.

    func setViewModel(users: [User])
}

protocol MainListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class MainInteractor: PresentableInteractor<MainPresentable>, MainInteractable, MainPresentableListener {

    private let userManager: UserManager
    private let friendsManager: FriendsManager

    private var userData: User? {
        didSet {
            updateUI()
        }
    }

    private var leaderbordUsers: [User] = [] {
        didSet {
            updateUI()
        }
    }

    private let mainScreenPresenter: MainScreenPresentable
    private let friendsScreenPresentable: FriendsPresentable

    weak var router: MainRouting?
    weak var listener: MainListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: MainPresentable,
         mainScreenPresenter: MainScreenPresentable,
         friendsScreenPresentable: FriendsPresentable,
         userManager: UserManager,
         friendsManager: FriendsManager) {
        self.userManager = userManager
        self.friendsManager = friendsManager
        self.mainScreenPresenter = mainScreenPresenter
        self.friendsScreenPresentable = friendsScreenPresentable

        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        fetchLeaderboard()
        fetchUserData()
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }

    private func fetchLeaderboard() {
        userManager.makeGetLeaderboardRequest { [weak self] result in
            switch result {
            case .success(let users):
                self?.leaderbordUsers = Array(users.prefix(3))

            case .failure(let error):
                print(error)
            }
        }
    }

    private func fetchUserData() {
        userManager.makeGetMeRequest { [weak self] result in
            switch result {
            case .success(let user):
                self?.userData = user

            case .failure(let error):
                print(error)
            }
        }
    }

    private func fetchFriends() {
        friendsManager.makeGetFriendsRequest { [weak self] result in
            switch result {
            case .success(let networkUsers):
                let users = networkUsers.users.map { User(networkUser: $0) }
                self?.friendsScreenPresentable.setViewModel(users: users)

            case .failure(let error):
                print(error)
            }
        }
    }

    private func updateUI() {
        mainScreenPresenter.setViewModel(user: userData, leaderboardUsers: leaderbordUsers)
    }

    func didFinish() {
        
    }

}

extension MainInteractor: MainScreenPresentableListener {

    func startGame() {
        router?.attachGameRIB()
    }

}
