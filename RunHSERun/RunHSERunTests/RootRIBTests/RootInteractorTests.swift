@testable import RIBs
@testable import RunHSERun
import XCTest

final class RootInteractorTests: XCTestCase {

    var interactor: RootInteractor!
    var router: RootRoutingMock!
    var secureSettingsKeeper: SecureSettingsKeeper!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        secureSettingsKeeper = SecureSettingsKeeperMock()
        interactor = RootInteractor(presenter: RootPresentableMock(), secureSettingsKeeper: secureSettingsKeeper)
        router = RootRoutingMock(viewControllable: ViewControllableMock(), interactable: interactor)
        interactor.router = router
    }

    // MARK: - Tests

    func test_checkUserStateWithoutToken() {
        interactor.didBecomeActive()
        XCTAssertEqual(RootRoutingMock.FirstScreenType.registration, router.firstScreen)
    }

    func test_checkUserStateWithToken() {
        secureSettingsKeeper.authToken = "123"
        interactor.didBecomeActive()
        XCTAssertEqual(RootRoutingMock.FirstScreenType.main, router.firstScreen)
    }

}
