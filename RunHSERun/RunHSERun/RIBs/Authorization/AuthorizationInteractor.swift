import RIBs
import RxSwift

protocol AuthorizationRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func moveToOTP()
    func moveToRegistration()
    func moveToNicknameChoosing()
}

protocol RegistrationPresentable: Presentable {
    var listener: RegistrationPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol OTPPresentable: Presentable {
    var listener: OTPPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol NicknameChoosingPresentable: Presentable {
    var listener: NicknameChoosingPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol AuthorizationListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func didFinish()
}

final class AuthorizationInteractor: PresentableInteractor<RegistrationPresentable>, AuthorizationInteractable {

    weak var router: AuthorizationRouting?
    weak var listener: AuthorizationListener?

    private var authManager: AuthManager
    private var OTPPresenter: OTPPresentable
    private var nicknameChoosingPresenter: NicknameChoosingPresentable

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(registrationPresenter: RegistrationPresentable,
         OTPPresenter: OTPPresentable,
         nicknameChoosingPresenter: NicknameChoosingPresentable,
         authManager: AuthManager) {
        self.authManager = authManager
        self.nicknameChoosingPresenter = nicknameChoosingPresenter
        self.OTPPresenter = OTPPresenter

        super.init(presenter: registrationPresenter)
        registrationPresenter.listener = self
        OTPPresenter.listener = self
        nicknameChoosingPresenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}

extension AuthorizationInteractor: RegistrationPresentableListener {

    func signIn(email: String) {
        authManager.makeSendVerifyEmailRequest(with: email) { [weak self] result in
            switch result {
            case .success:
                self?.router?.moveToOTP()

            case .failure(let error):
                print(error)
            }
        }
    }

}

extension AuthorizationInteractor: OTPPresentableListener {

    func signIn(code: Int) {
        authManager.makeVerifyRequest(with: code) { [weak self] result in
            switch result {
            case .success(let response):
                switch response {
                case .moveNext:
                    self?.router?.moveToNicknameChoosing()

                case .needRegistration:
                    self?.router?.moveToNicknameChoosing()
                }

            case .failure(let error):
                print(error)
            }
        }
    }

}

extension AuthorizationInteractor: NicknameChoosingPresentableListener {

    func signIn(nickname: String) {
        authManager.makeRegistrationRequest(with: nickname) { [weak self] result in
            switch result {
            case .success(let response):
                switch response {
                case .moveNext:
                    self?.router?.moveToNicknameChoosing()
                }

            case .failure(let error):
                print(error)
            }
        }
    }

}
