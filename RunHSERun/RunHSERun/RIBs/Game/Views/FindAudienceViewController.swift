import UIKit
import RIBs
import MHLoadingButton

final class FindAudienceViewController: UIViewController {

    // MARK: - Internal Properties

    var viewModel: FindAudienceViewModel? {
        didSet {
            guard isViewLoaded, viewModel != oldValue else {
                return
            }

            updateUI()
        }
    }

    private var tableView: UITableView!
    private var searchBar: UISearchBar!
    private var button: LoadingButton!

    private var gameManager: GameManager = GameManager(gameService: GameService(grpcChannel: GRPCChannelProvider().grpcChannel),
                                                       secureSettingsKeeper: SecureSettingsKeeper())
    
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
        configureTableView()
    }

    private func configureTableView() {
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false

        let footerView = UIView()
        footerView.frame.size.height = .leastNonzeroMagnitude
        tableView.tableFooterView = footerView

        tableView.register(AudienceCell.self,
                           forCellReuseIdentifier: AudienceCell.reuseID)

        tableView.dataSource = self
    }

    private func updateUI() {
        tableView.reloadData()
    }

    private func applyColorScheme() {
        view.backgroundColor = .white
        tableView.backgroundColor = .white
    }

    private func addSubviews() {
        searchBar = UISearchBar()
        tableView = UITableView(frame: .zero, style: .plain)
        button = LoadingButton(text: "Back", textColor: UIColor(named: "back")!, font: UIFont.systemFont(ofSize: 20), bgColor: .white)

        searchBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        view.addSubviews([searchBar, tableView, button])

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 150),

            searchBar.topAnchor.constraint(equalTo: button.bottomAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

    }

}

extension FindAudienceViewController : UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

    }

}

extension FindAudienceViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }

        return viewModel.rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else {
            return UITableViewCell()
        }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: AudienceCell.reuseID, for: indexPath) as? AudienceCell else {

            return UITableViewCell()
        }

        cell.apply()
        cell.completion = {
            self.gameManager.makePutInQueueRequest(roomId: 345) { _ in
                let vc = WaitingScreenViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
        }
        cell.configure(with: viewModel.rows[indexPath.row])
        return cell
    }

}

extension FindAudienceViewController: FindAudienceViewControllable {

    func setViewModel(viewModel: FindAudienceViewModel) {
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
