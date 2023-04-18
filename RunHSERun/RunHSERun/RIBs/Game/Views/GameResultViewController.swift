import UIKit
import RIBs
import MHLoadingButton

final class GameResultViewController: UIViewController {

    // MARK: - Internal Properties

    var viewModel: GameResultViewModel? {
        didSet {
            guard isViewLoaded, viewModel != oldValue else {
                return
            }

            updateUI()
        }
    }

    private var containerView: UIView!
    private var label: UILabel!
    private var button: LoadingButton!

    override func loadView() {
        view = UIView()
        addSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        applyColorScheme()
        updateUI()
    }

    private func configureUI() {
        label.font = .systemFont(ofSize: 60)
        containerView.layer.cornerRadius = 30

    }

    private func updateUI() {
        label.text = viewModel?.result
    }

    private func applyColorScheme() {
        view.backgroundColor = UIColor(named: "back")
        label.textColor = UIColor(named: "back")
        containerView.backgroundColor = .white
    }

    private func addSubviews() {
        label = UILabel()
        containerView = UIView()
        button = LoadingButton(text: "Back", textColor: UIColor(named: "back")!, font: UIFont.systemFont(ofSize: 20), bgColor: .white)

        containerView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        containerView.addSubview(label)
        view.addSubviews([containerView, button])

        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 300),
            containerView.heightAnchor.constraint(equalToConstant: 200),

            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),

            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 150)
        ])
    }

}

extension GameResultViewController: GameResultViewControllable {

    func setViewModel(viewModel: GameResultViewModel) {
        self.viewModel = viewModel
    }

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
