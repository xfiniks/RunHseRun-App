@testable import RIBs
@testable import RunHSERun
@testable import RxSwift

final class MainRoutingMock: MainRouting {

    var viewControllable: ViewControllable
    var interactable: Interactable
    var children: [Routing] = []
    var lifecycle: RxSwift.Observable<RouterLifecycle> = RxSwift.Observable.just(.didLoad)

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

    func attachGameRIB() {
        // Do nothing
    }

}

final class MainScreenPresentableMock: MainScreenPresentable {

    var listener: MainScreenPresentableListener?
    var viewModel: MainScreenViewModel?

    func setViewModel(user: User?, leaderboardUsers: [User]) {
        viewModel = .init(user: user ?? User.default, leaderboardUsers: leaderboardUsers)
    }

}
