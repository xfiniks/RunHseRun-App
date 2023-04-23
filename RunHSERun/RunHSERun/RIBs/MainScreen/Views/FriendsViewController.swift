import RIBs
import UIKit
import MHLoadingButton

final class FriendsViewController: UIViewController {

    private var friendsTableView: UITableView!
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
        configureFriendsTableView()
    }

    private func configureFriendsTableView() {

    }

    private func applyColorScheme() {
        view.backgroundColor = UIColor(named: "back")
        friendsTableView.backgroundColor = .white
    }

    private func addSubviews() {
        friendsTableView = UITableView(frame: .zero, style: .grouped)
        backButton = LoadingButton(text: "Back",
                                   textColor: .white,
                                   font: UIFont.systemFont(ofSize: 15),
                                   bgColor: UIColor(named: "back")!)

        [
            friendsTableView,
            backButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        view.addSubviews([backButton, friendsTableView])

        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.widthAnchor.constraint(equalToConstant: 300),

            friendsTableView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 40),
            friendsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            friendsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            friendsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    @objc
    private func backButtonPressed() {

    }

}


