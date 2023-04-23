import RIBs
import UIKit
import MHLoadingButton

final class FindFriendsViewController: UIViewController {

    private var usersTableView: UITableView!
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
        usersTableView.backgroundColor = .white
    }

    private func addSubviews() {
        usersTableView = UITableView(frame: .zero, style: .grouped)
        backButton = LoadingButton(text: "Back",
                                   textColor: .white,
                                   font: UIFont.systemFont(ofSize: 15),
                                   bgColor: UIColor(named: "back")!)

        [
            usersTableView,
            backButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        view.addSubviews([backButton, usersTableView])

        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.widthAnchor.constraint(equalToConstant: 300),

            usersTableView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 40),
            usersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            usersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            usersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    @objc
    private func backButtonPressed() {

    }

}



