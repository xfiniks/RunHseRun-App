import UIKit
import RIBs
import MHLoadingButton

final class WaitingScreenViewController: UIViewController {

    private var label: UILabel!
    private var button: LoadingButton!

    override func loadView() {
        view = UIView()
        addSubviews()
    }

    private var streamManager = StreamManager(stream: GRPCStream(grpcChannel: GRPCChannelProvider().grpcChannel), secureSettingsKeeper: SecureSettingsKeeper())

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        applyColorScheme()
        updateUI()

        DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 300000)) { [weak self] in
            let vc = GameViewController()
            vc.viewModel = .init(audiences: ["R201", "R406", "S302"], currentAudience: "R201") { _ in
                vc.viewModel = .init(audiences: ["R201", "R406", "S302"], currentAudience: "R406") { _ in
                    vc.viewModel = .init(audiences: ["R201", "R406", "S302"], currentAudience: "S302") { _ in
                        let manager = GameManager(gameService: GameService(grpcChannel: GRPCChannelProvider().grpcChannel), secureSettingsKeeper: SecureSettingsKeeper())
                        manager.makeSendTimeRequest(time: 349, gameId: 5) { result in

                        }
                    }
                }
            }
            vc.modalPresentationStyle = .fullScreen
            self?.present(vc, animated: true)
        }
    }

    private func configureUI() {
        label.font = .systemFont(ofSize: 50)

    }

    private func updateUI() {
        label.text = "Waiting..."
    }

    private func applyColorScheme() {
        view.backgroundColor = UIColor(named: "back")
        label.textColor = .white
    }

    private func addSubviews() {
        label = UILabel()
        button = LoadingButton(text: "Back", textColor: UIColor(named: "back")!, font: UIFont.systemFont(ofSize: 20), bgColor: .white)

        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 200
        stack.alignment = .center

        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.addArrangedSubview(label)
        stack.addArrangedSubview(button)

        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

}

extension WaitingScreenViewController: WaitingScreenViewControllable {

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

