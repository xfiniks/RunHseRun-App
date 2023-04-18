import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class RootViewController: UIViewController, RootPresentable {

    weak var listener: RootPresentableListener?

    private var label: UILabel!

    override func loadView() {
        view = UIView()
        addSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        applyColorScheme()
    }

    private func configureUI() {
        label.text = "HI!"
        label.font = .systemFont(ofSize: 50)
    }

    private func applyColorScheme() {
        label.textColor = UIColor(named: "back")
    }

    private func addSubviews() {
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension RootViewController: RootViewControllable {

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
