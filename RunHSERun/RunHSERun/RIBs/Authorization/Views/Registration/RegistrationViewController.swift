import UIKit
import RIBs
import MHLoadingButton

protocol RegistrationPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.

    func signIn(email: String)
}

final class RegistrationViewController: UIViewController {

    private enum Constants {

        enum ImageView {

            static var image: UIImage {
                UIImage(named: "logo")!.withTintColor(.white)
            }

            static var imageWidth: CGFloat {
                250
            }

            static var imageHeight: CGFloat {
                250
            }

            static var topIndent: CGFloat {
                0
            }

        }

        enum TextField {

            static var borderWidth: CGFloat {
                2
            }

            static var height: CGFloat {
                50
            }

            static var topIndent: CGFloat {
                20
            }

            static var width: CGFloat {
                300
            }

        }

        enum BottomElementsView {

            static var cornerRadius: CGFloat {
                25
            }

        }

        enum Label {

            static var topIndent: CGFloat {
                20
            }

        }

        enum Button {

            static var width: CGFloat {
                300
            }

            static var topIndent: CGFloat {
                20
            }

            static var bottomIndent: CGFloat {
                -20
            }

        }

    }

    private var bottomElementsView: UIView!
    private var logoImageView: UIImageView!
    private var mailDescription: UILabel!
    private var label: UILabel!
    private var textField: UITextField!
    private var button: LoadingButton!

    weak var listener: RegistrationPresentableListener?

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

    private func configureUI() {
        configureLogoImageView()
        configureLabel()
        configureTextField()
        configureButton()
        configureBottomElementsView()
    }

    private func configureBottomElementsView() {
        bottomElementsView.clipsToBounds = true
        bottomElementsView.layer.cornerRadius = Constants.BottomElementsView.cornerRadius
        bottomElementsView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }

    private func configureLogoImageView() {
        logoImageView.image = Constants.ImageView.image

        NSLayoutConstraint.activate([
            logoImageView.heightAnchor.constraint(equalToConstant: Constants.ImageView.imageHeight),
            logoImageView.widthAnchor.constraint(equalToConstant: Constants.ImageView.imageWidth)
        ])
    }

    private func configurEmailDescription() {
        mailDescription.text = "Enter your email"
        mailDescription.numberOfLines = 0
        mailDescription.font = UIFont.boldSystemFont(ofSize: 20.0)
        mailDescription.textColor = .white
        mailDescription.textAlignment = .center
    }

    private func configureLabel() {
        label.text = "Email"
        label.textColor = UIColor(named: "back")
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 28.0)
    }

    private func configureTextField() {
        textField.keyboardType = .emailAddress
        textField.textAlignment = .center
        textField.textColor = UIColor(named: "back")
        textField.layer.cornerRadius = Constants.TextField.height / 2
        textField.placeholder = "swag@edu.hse.ru"
        textField.layer.borderWidth = Constants.TextField.borderWidth
        textField.layer.borderColor = UIColor(named: "back")!.cgColor
    }

    private func configureButton() {
        button.indicator = BallPulseSyncIndicator(color: .white)
        //        button.showLoader(userInteraction: true)
    }

    private func applyColorScheme() {
        view.backgroundColor = UIColor(named: "back")
        button.backgroundColor = UIColor(named: "back")
        bottomElementsView.backgroundColor = .white
    }

    @objc
    private func signIn() {
        listener?.signIn(email: textField.text ?? "xfiniks@gmail.com")
    }

    private func addSubviews() {
        logoImageView = UIImageView()
        label = UILabel()
        textField = UITextField()
        button = LoadingButton(text: "Sign in", textColor: .white, bgColor: UIColor(named: "back")!)

        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)


        bottomElementsView = UIView()
        mailDescription = UILabel()

        [
            logoImageView,
            label,
            textField,
            button,
            bottomElementsView,
            logoImageView,
            mailDescription
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        bottomElementsView.addSubviews([label, textField, button])
        view.addSubviews([mailDescription, logoImageView, bottomElementsView, logoImageView])

        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.ImageView.topIndent),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            mailDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mailDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mailDescription.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),

            bottomElementsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomElementsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomElementsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            label.topAnchor.constraint(equalTo: bottomElementsView.topAnchor, constant: Constants.Label.topIndent),
            label.centerXAnchor.constraint(equalTo: bottomElementsView.centerXAnchor),

            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: Constants.TextField.topIndent),
            textField.heightAnchor.constraint(equalToConstant: Constants.TextField.height),
            textField.widthAnchor.constraint(equalToConstant: Constants.TextField.width),
            textField.centerXAnchor.constraint(equalTo: bottomElementsView.centerXAnchor),

            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: Constants.Button.topIndent),
            button.heightAnchor.constraint(equalToConstant: Constants.TextField.height),
            button.widthAnchor.constraint(equalToConstant: Constants.Button.width),
            button.centerXAnchor.constraint(equalTo: bottomElementsView.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: Constants.Button.bottomIndent)
        ])
    }

}

extension RegistrationViewController: AuthorizationViewControllable {

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

extension RegistrationViewController: RegistrationPresentable {

    

}
