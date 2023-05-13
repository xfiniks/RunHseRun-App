@testable import RIBs
@testable import RunHSERun
@testable import RxSwift

final class RootRoutingMock: RootRouting {

    enum FirstScreenType {
        case registration
        case main
    }

    var viewControllable: ViewControllable
    var interactable: Interactable
    var children: [Routing] = []
    var lifecycle: RxSwift.Observable<RouterLifecycle> = RxSwift.Observable.just(.didLoad)
    var firstScreen: FirstScreenType?

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

    func moveToRegistration() {
        firstScreen = .registration
    }

    func moveToMainScreen() {
        firstScreen = .main
    }

}

final class SecureSettingsKeeperMock: SecureSettingsKeeper {

    var authToken: String?

    func clear() {
        // Do Nothing
    }

}

final class RootPresentableMock: RootPresentable {

    var listener: RootPresentableListener?
    
}
