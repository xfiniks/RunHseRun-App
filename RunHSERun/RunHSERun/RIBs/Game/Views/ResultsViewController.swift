import RIBs
import UIKit
import MHLoadingButton

final class ResultsViewController: UIViewController {

    private var containerView: UIView!
    private var resultsLabel: UILabel!
    private var backButton: LoadingButton!

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
        configureResultsLabel()
    }

    private func configureContainerView() {
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true
    }

    private func configureResultsLabel() {
        resultsLabel.text = "Win"
        resultsLabel.font = .boldSystemFont(ofSize: 70)
    }

    private func applyColorScheme() {
        view.backgroundColor = UIColor(named: "back")
        containerView.backgroundColor = .white
        resultsLabel.textColor = UIColor(named: "back")
    }

    private func addSubviews() {
        containerView = UIView()
        resultsLabel = UILabel()
        backButton = LoadingButton(text: "Back",
                                   textColor: UIColor(named: "back")!,
                                   font: UIFont.systemFont(ofSize: 15),
                                   bgColor: .white)

        [
            containerView,
            resultsLabel,
            backButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        containerView.addSubview(resultsLabel)
        view.addSubviews([containerView, backButton])

        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 125),
            containerView.widthAnchor.constraint(equalToConstant: 300),

            resultsLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            resultsLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),

            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }

    @objc
    private func backButtonPressed() {

    }

}

