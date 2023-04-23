import RIBs
import RxSwift

protocol MainRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
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

protocol MainListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class MainInteractor: PresentableInteractor<MainPresentable>, MainInteractable, MainPresentableListener {

    private let userManager: UserManager
    private let userDataKeeper: UserDataKeeper

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

    weak var router: MainRouting?
    weak var listener: MainListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: MainPresentable, mainScreenPresenter: MainScreenPresentable, userManager: UserManager, userDataKeeper: UserDataKeeper) {
        self.userManager = userManager
        self.userDataKeeper = userDataKeeper
        self.mainScreenPresenter = mainScreenPresenter

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

    private func updateUI() {
        mainScreenPresenter.setViewModel(user: userData, leaderboardUsers: leaderbordUsers)
    }

}

extension MainInteractor: MainScreenPresentableListener {

}
