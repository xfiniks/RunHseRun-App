import RIBs
import UIKit
import MHLoadingButton

protocol WaitingScreenPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class WaitingScreenViewController: UIViewController, ViewControllable, WaitingScreenPresentable {

    var listener: WaitingScreenPresentableListener?

    private var containerView: UIView!
    private var timerDescriptionLabel: UILabel!
    private var timerLabel: UILabel!
    private var waitingLabel: UILabel!
    private var backButton: LoadingButton!

    private var timer: Timer?
    private var timePassed: Int = 0

    override func loadView() {
        view = UIView()
        addSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        applyColorScheme()
    }

    private func configureUI() {
        configureContainerView()
        configureTimerLabel()
        configureBackButton()
        configureWaitingLabel()
        configureTimer()
    }

    private func configureContainerView() {
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
    }

    private func configureTimerLabel() {
        timerLabel.text = "00:00"
        timerLabel.font = .boldSystemFont(ofSize: 70)
    }

    private func configureTimerDescriptionLabel() {
        timerDescriptionLabel.text = "Your time in queue"
        timerDescriptionLabel.font = .systemFont(ofSize: 13)
    }

    private func configureBackButton() {

    }

    private func configureWaitingLabel() {
        waitingLabel.text = "Waiting"
        waitingLabel.font = .boldSystemFont(ofSize: 70)
    }

    private func configureTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerTick), userInfo: nil, repeats: true)
    }

    private func applyColorScheme() {
        view.backgroundColor = UIColor(named: "back")
        containerView.backgroundColor = .white
        timerLabel.textColor = UIColor(named: "back")
        timerDescriptionLabel.textColor = .white
        waitingLabel.backgroundColor = .white
    }

    private func addSubviews() {
        containerView = UIView()
        timerDescriptionLabel = UILabel()
        timerLabel = UILabel()
        waitingLabel = UILabel()
        backButton = LoadingButton(text: "Back",
                                   textColor: UIColor(named: "back")!,
                                   font: UIFont.systemFont(ofSize: 15),
                                   bgColor: .white)

        [
            containerView,
            timerDescriptionLabel,
            timerLabel,
            waitingLabel,
            backButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        containerView.addSubview(timerLabel)
        view.addSubviews([containerView, timerLabel, waitingLabel, backButton])

        NSLayoutConstraint.activate([
            waitingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            waitingLabel.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),

            timerDescriptionLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 40),
            timerDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            containerView.topAnchor.constraint(equalTo: timerDescriptionLabel.bottomAnchor, constant: 5),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 125),
            containerView.widthAnchor.constraint(equalToConstant: 300),

            timerLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),

            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }

    @objc
    private func timerTick() {
        timePassed += 1
        timerLabel.text = timePassed.toTime
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
