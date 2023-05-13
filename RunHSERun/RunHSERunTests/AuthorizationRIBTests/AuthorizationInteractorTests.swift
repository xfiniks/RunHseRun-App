@testable import RIBs
@testable import RunHSERun
import XCTest

final class AuthorizationInteractorTests: XCTestCase {

    var interactor: AuthorizationInteractor!
    var router: AuthorizationRoutingMock!
    var authManager: AuthManagerMock!
    var listener: AuthorizationListenerMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        listener = AuthorizationListenerMock()
        authManager = AuthManagerMock()
        interactor = AuthorizationInteractor(registrationPresenter: RegistrationPresentableMock(),
                                             OTPPresenter: OTPPresentableMock(),
                                             nicknameChoosingPresenter: NicknameChoosingPresentableMock(),
                                             authManager: authManager)

        router = AuthorizationRoutingMock(viewControllable: ViewControllableMock(), interactable: interactor)
        interactor.router = router
        interactor.listener = listener
    }

    // MARK: - Tests

    func test_registrationSignIn() {
        interactor.signIn(email: "123")
        XCTAssertEqual(AuthorizationRoutingMock.NextScreenType.otp, router.nextScreen)
    }

    func test_otpSignInNewAccount() {
        authManager.authVerifyResponse = .needRegistration
        interactor.signIn(code: 1234)
        XCTAssertEqual(AuthorizationRoutingMock.NextScreenType.nickname, router.nextScreen)
    }

    func test_otpSignInAlreadyHasAccount() {
        authManager.authVerifyResponse = .moveNext
        interactor.signIn(code: 1234)
        XCTAssertEqual(true, listener.finish)
    }

    func test_nicknameChoosingSignIn() {
        authManager.authRegisterResponse = .moveNext
        interactor.signIn(nickname: "finiks")
        XCTAssertEqual(true, listener.finish)
    }

}
