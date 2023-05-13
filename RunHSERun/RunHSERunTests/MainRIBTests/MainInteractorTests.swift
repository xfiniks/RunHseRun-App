@testable import RIBs
@testable import RunHSERun
import XCTest

final class MainInteractorTests: XCTestCase {

    var interactor: MainInteractor!
    var router: MainRoutingMock!
    var userManager: UserManagerMock!
    var presenter: MainScreenPresentableMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        userManager = UserManagerMock()
        presenter = MainScreenPresentableMock()
        interactor = MainInteractor(presenter: MainViewController(),
                                    mainScreenPresenter: presenter,
                                    friendsScreenPresentable: FriendsViewController(),
                                    userManager: userManager,
                                    friendsManager: FriendsManagerMock())

        router = MainRoutingMock(viewControllable: ViewControllableMock(), interactable: interactor)
        interactor.router = router
    }

    // MARK: - Tests

    func test_interactorBeginActive() {
        interactor.didBecomeActive()
        let viewModel: MainScreenViewModel = .init(user: User.default, leaderboardUsers: [User.default])
        XCTAssertEqual(viewModel, presenter.viewModel)
    }

}

