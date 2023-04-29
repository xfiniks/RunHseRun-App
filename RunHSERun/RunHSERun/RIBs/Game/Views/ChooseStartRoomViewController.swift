import RIBs
import UIKit
import MHLoadingButton

protocol ChooseStartRoomPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func handleTapOnRoomButton(id: Int)
    func handleBackButtonPressed()
}

final class ChooseStartRoomViewController: UIViewController, ViewControllable {

    var viewModel: ChooseStartRoomScreenViewModel? {
        didSet {
            guard isViewLoaded, viewModel != oldValue else {
                return
            }

            updateUI()
        }
    }

    var listener: ChooseStartRoomPresentableListener?

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
        roomsTableView.separatorStyle = .none
        roomsTableView.showsVerticalScrollIndicator = false
        roomsTableView.showsHorizontalScrollIndicator = false

        roomsTableView.register(RoomCell.self,
                           forCellReuseIdentifier: RoomCell.reuseID)

        roomsTableView.dataSource = self
    }

    private func configureBackButton() {
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    }

    private func applyColorScheme() {
        view.backgroundColor = UIColor(named: "back")
        roomsTableView.backgroundColor = .white
    }

    private func updateUI() {

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
        guard let listener = listener else {
            return
        }

        listener.handleBackButtonPressed()
    }

}

extension ChooseStartRoomViewController: ChooseStartRoomScreenPresentable {

    func setViewModel(rooms: [Room]) {
        viewModel = .init(rooms: rooms)
    }

}

extension ChooseStartRoomViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }

        return viewModel.rooms.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else {
            return UITableViewCell()
        }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: RoomCell.reuseID, for: indexPath) as? RoomCell else {
            return UITableViewCell()
        }

        cell.apply()

        cell.completion = { [weak self] (id) in
            guard let this = self else {
                return
            }

            this.listener?.handleTapOnRoomButton(id: id)
        }

        cell.configure(with: viewModel.rooms[indexPath.row])
        return cell
    }

}

extension ChooseStartRoomViewController: ChooseStartRoomViewControllable {

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
