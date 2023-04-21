import UIKit
import RIBs
import AEOTPTextField
import MHLoadingButton

protocol OTPPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func signIn(code: Int)

}

final class OTPViewController: UIViewController {

    private enum Constants {

        enum BottomElementsView {

            static var cornerRadius: CGFloat {
                25
            }

        }

    }

    private var label: UILabel!
    private var mailDescription: UILabel!
    private var bottomElementsView: UIView!
    private var mailImageView: UIImageView!
    private var otpTextField: AEOTPTextField!
    private var timerLabel: UILabel!
    private var sendNewCodeButton: LoadingButton!
    private var changeEmailButton: LoadingButton!

    var listener: OTPPresentableListener?

    override func loadView() {
        view = UIView()
        addSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        applyColorScheme()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }

    private func configureMailImageView() {
        mailImageView.image = UIImage(named: "email")

        NSLayoutConstraint.activate([
            mailImageView.heightAnchor.constraint(equalToConstant: 125),
            mailImageView.widthAnchor.constraint(equalToConstant: 125)
        ])
    }

    private func configurEmailDescription() {
        mailDescription.text = "Enter your code from email"
        mailDescription.numberOfLines = 0
        mailDescription.font = UIFont.boldSystemFont(ofSize: 20.0)
        mailDescription.textColor = .white
        mailDescription.textAlignment = .center
    }

    private func configureTimerLabel() {
        timerLabel.text = "You can get a new code in 42 seconds"
        timerLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        timerLabel.textColor = UIColor(named: "back")!
        timerLabel.textAlignment = .center
    }

    private func configureSendNewCodeButton() {
        sendNewCodeButton.setCornerBorder(color: UIColor(named: "back"))
    }

    private func configureChangeEmailButton() {
        changeEmailButton.setCornerBorder(color: UIColor(named: "back"))
    }

    private func configureContainerView() {
        bottomElementsView.clipsToBounds = true
        bottomElementsView.layer.cornerRadius = Constants.BottomElementsView.cornerRadius
        bottomElementsView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }

    private func configureOTPTextField() {
//        otpTextField.otpDefaultCharacter = "*"
//        otpTextField.otpBackgroundColor = .clear
        otpTextField.otpDefaultBorderColor = .clear
        otpTextField.otpFilledBorderColor = .clear
//        otpTextField.otpFilledBackgroundColor = .clear
        otpTextField.otpFontSize = 20
        otpTextField.otpFont = UIFont.systemFont(ofSize: 30)
        otpTextField.configure(with: 4)
        otpTextField.otpDelegate = self

        NSLayoutConstraint.activate([
//            otpTextField.heightAnchor.constraint(equalToConstant: 30),
//            otpTextField.widthAnchor.constraint(equalToConstant: 145)
//            otpTextField.heightAnchor.constraint(equalToConstant: 60),
            otpTextField.heightAnchor.constraint(equalToConstant: 50),
            otpTextField.widthAnchor.constraint(equalToConstant: 230)
        ])
    }

    private func configureLabel() {
        label.text = "Code"
        label.font = UIFont.boldSystemFont(ofSize: 28.0)
        label.textColor = UIColor(named: "back")
        label.textAlignment = .center
    }

    private func configureUI() {
        configureOTPTextField()
        configureLabel()
        configureContainerView()
        configureMailImageView()
        configurEmailDescription()
        configureTimerLabel()
        configureSendNewCodeButton()
        configureChangeEmailButton()
    }

    private func applyColorScheme() {
        view.backgroundColor = UIColor(named: "back")
        bottomElementsView.backgroundColor = .white
    }

    private func addSubviews() {
        otpTextField = AEOTPTextField()
        label = UILabel()
        bottomElementsView = UIView()
        mailImageView = UIImageView()
        mailDescription = UILabel()
        timerLabel = UILabel()
        sendNewCodeButton = LoadingButton(text: "Send new code", textColor: UIColor(named: "back"), bgColor: .clear)
        changeEmailButton = LoadingButton(text: "Change email", textColor: UIColor(named: "back"), bgColor: .clear)

        [
            label,
            otpTextField,
            mailImageView,
            bottomElementsView,
            mailDescription,
            timerLabel,
            sendNewCodeButton,
            changeEmailButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        bottomElementsView.addSubviews([otpTextField, label, timerLabel, sendNewCodeButton, changeEmailButton])
        view.addSubviews([mailImageView, mailDescription, bottomElementsView])

        NSLayoutConstraint.activate([
            mailImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            mailImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            mailDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mailDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mailDescription.topAnchor.constraint(equalTo: mailImageView.bottomAnchor, constant: 20),

            bottomElementsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomElementsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomElementsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            label.topAnchor.constraint(equalTo: bottomElementsView.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: bottomElementsView.leadingAnchor),
            label.centerXAnchor.constraint(equalTo: bottomElementsView.centerXAnchor),

            otpTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40),
            otpTextField.centerXAnchor.constraint(equalTo: bottomElementsView.centerXAnchor),
            otpTextField.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -250),

            timerLabel.topAnchor.constraint(equalTo: otpTextField.bottomAnchor, constant: 30),
            timerLabel.leadingAnchor.constraint(equalTo: bottomElementsView.leadingAnchor),
            timerLabel.trailingAnchor.constraint(equalTo: bottomElementsView.trailingAnchor),

            sendNewCodeButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 70),
            sendNewCodeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendNewCodeButton.heightAnchor.constraint(equalToConstant: 50),
            sendNewCodeButton.widthAnchor.constraint(equalToConstant: 300),

            changeEmailButton.topAnchor.constraint(equalTo: sendNewCodeButton.bottomAnchor, constant: 10),
            changeEmailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeEmailButton.heightAnchor.constraint(equalToConstant: 50),
            changeEmailButton.widthAnchor.constraint(equalToConstant: 300),
        ])
    }

}

extension OTPViewController: AEOTPTextFieldDelegate, UITextFieldDelegate {

    func didUserFinishEnter(the code: String) {
        print(code)
        listener?.signIn(code: Int(code) ?? 1234)
    }

}

extension OTPViewController: AuthorizationViewControllable {

    func replaceModal(viewController: ViewControllable?) {
        if presentedViewController != nil {
            dismiss(animated: true) { [weak self] in
                self?.presentTargetViewController(viewController: viewController)
            }
        } else {
            presentTargetViewController(viewController: viewController)
        }
    }

    private func presentTargetViewController(viewController: ViewControllable?) {
        if let viewController = viewController {
            viewController.uiviewController.modalPresentationStyle = .fullScreen
            present(viewController.uiviewController, animated: true)
        }
    }

}

extension OTPViewController: OTPPresentable {

}
