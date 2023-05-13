@testable import RIBs
@testable import RunHSERun
@testable import RxSwift

final class AuthorizationRoutingMock: AuthorizationRouting {

    enum NextScreenType {
        case otp
        case nickname
    }

    var viewControllable: ViewControllable
    var interactable: Interactable
    var children: [Routing] = []
    var lifecycle: RxSwift.Observable<RouterLifecycle> = RxSwift.Observable.just(.didLoad)
    var nextScreen: NextScreenType?

    init(viewControllable: ViewControllable, interactable: Interactable) {
        self.viewControllable = viewControllable
        self.interactable = interactable
    }

    func load() {
        // Do nothing
    }

    func attachChild(_ child: Routing) {
        // Do nothing
    }

    func detachChild(_ child: Routing) {
        // Do nothing
    }

    func moveToOTP() {
        nextScreen = .otp
    }


    func moveToNicknameChoosing() {
        nextScreen = .nickname
    }

}

final class OTPPresentableMock: OTPPresentable {

    var listener: OTPPresentableListener?

}

final class NicknameChoosingPresentableMock: NicknameChoosingPresentable {

    var listener: NicknameChoosingPresentableListener?

}

final class RegistrationPresentableMock: RegistrationPresentable {

    var listener: RegistrationPresentableListener?

}

final class AuthorizationListenerMock: AuthorizationListener {

    var finish: Bool = false

    func didFinish() {
        finish = true
    }

}
