import RIBs
import RxSwift

protocol RootRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func moveToRegistration()
}

protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable, RootPresentableListener {

    weak var router: RootRouting?

    private let secureSettingsKeeper: SecureSettingsKeeper

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: RootPresentable, secureSettingsKeeper: SecureSettingsKeeper) {
        self.secureSettingsKeeper = secureSettingsKeeper

        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        router?.moveToRegistration()
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }

    private func checkUserState() {
        
    }

    func didFinish() {
        
    }
}
