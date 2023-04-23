import RIBs
import UIKit
import MHLoadingButton

final class ChooseStartRoomViewController: UIViewController {

    private var roomsTableView: UITableView!
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
        configureRoomsTableView()
    }

    private func configureRoomsTableView() {

    }

    private func applyColorScheme() {
        view.backgroundColor = UIColor(named: "back")
        roomsTableView.backgroundColor = .white
    }

    private func addSubviews() {
        roomsTableView = UITableView(frame: .zero, style: .grouped)
        backButton = LoadingButton(text: "Back",
                                   textColor: .white,
                                   font: UIFont.systemFont(ofSize: 15),
                                   bgColor: UIColor(named: "back")!)

        [
            roomsTableView,
            backButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        view.addSubviews([backButton, roomsTableView])

        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.widthAnchor.constraint(equalToConstant: 300),

            roomsTableView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 40),
            roomsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            roomsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            roomsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    @objc
    private func backButtonPressed() {

    }

}


