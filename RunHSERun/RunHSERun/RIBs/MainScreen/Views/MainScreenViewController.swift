import UIKit
import MHLoadingButton
import RIBs

protocol MainScreenPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func startGame()
}

final class MainScreenViewController: UIViewController {

    private enum Constants {

        enum ImageView {

            static var image: UIImage {
                UIImage(named: "avatar")!
            }

            static var imageWidth: CGFloat {
                100
            }

            static var imageHeight: CGFloat {
                100
            }

            static var topIndent: CGFloat {
                40
            }

        }

    }

    var viewModel: MainScreenViewModel? {
        didSet {
            guard isViewLoaded, viewModel != oldValue else {
                return
            }

            updateUI()
        }
    }

    var listener: MainScreenPresentableListener?

    private var avatarImageView: UIImageView!
    private var avatarContainerView: UIView!
    private var nicknameLabel: UILabel!
    private var qrCodeButton: UIButton!
    private var settingsButton: UIButton!
    private var leaderboardContainerView: UIView!
    private var leaderboardLabel: UILabel!
    private var firstPlaceImageView: UIImageView!
    private var firstPlaceResultLabel: UILabel!
    private var firstPlaceNicknameLabel: UILabel!
    private var firstPlaceImageContainer: UIView!
    private var secondPlaceImageView: UIImageView!
    private var secondPlaceResultLabel: UILabel!
    private var secondPlaceNicknameLabel: UILabel!
    private var secondPlaceImageContainer: UIView!
    private var thirdPlaceImageView: UIImageView!
    private var thirdPlaceResultLabel: UILabel!
    private var thirdPlaceNicknameLabel: UILabel!
    private var thirdPlaceImageContainer: UIView!
    private var startGamebutton: LoadingButton!
    private var startGameWithFriendButton: LoadingButton!

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
        configureAvatarImageView()
        configureNicknameLabel()
        configurQrCodeButton()
        configureSettingsButton()
        configureLeaderboard()

        updateUI()
    }

    private func updateUI() {
        guard let viewModel = viewModel else {
            return
        }

        avatarImageView.image = viewModel.user.image
        nicknameLabel.text = viewModel.user.nickname

        firstPlaceImageView.image = viewModel.leaderboardUsers[0].image
        firstPlaceResultLabel.text = String(viewModel.leaderboardUsers[0].score)
        firstPlaceNicknameLabel.text = viewModel.leaderboardUsers[0].nickname

        secondPlaceImageView.image = viewModel.leaderboardUsers[1].image
        secondPlaceResultLabel.text = String(viewModel.leaderboardUsers[1].score)
        secondPlaceNicknameLabel.text = viewModel.leaderboardUsers[1].nickname

        thirdPlaceImageView.image = viewModel.leaderboardUsers[2].image
        thirdPlaceResultLabel.text = String(viewModel.leaderboardUsers[2].score)
        thirdPlaceNicknameLabel.text = viewModel.leaderboardUsers[2].nickname
    }

    private func configureAvatarImageView() {
        avatarImageView.image = Constants.ImageView.image
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.layer.masksToBounds = false
        avatarImageView.clipsToBounds = true

        avatarContainerView.setCornerBorder(color: .white, cornerRadius: 55, borderWidth: 2.5)

        NSLayoutConstraint.activate([
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.ImageView.imageHeight),
            avatarImageView.widthAnchor.constraint(equalToConstant: Constants.ImageView.imageWidth),

            avatarContainerView.heightAnchor.constraint(equalToConstant: 110),
            avatarContainerView.widthAnchor.constraint(equalToConstant: 110)
        ])
    }

    private func configureNicknameLabel() {
        nicknameLabel.text = "xfiniks"
    }

    @objc
    private func moveToQrScreen() {

    }

    private func configurQrCodeButton() {
        qrCodeButton.setBackgroundImage(UIImage(named: "qr")?.withTintColor(.white), for: .normal)
        qrCodeButton.addTarget(self, action: #selector(moveToQrScreen), for: .touchUpInside)

        NSLayoutConstraint.activate([
            qrCodeButton.heightAnchor.constraint(equalToConstant: 30),
            qrCodeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func configureSettingsButton() {
        settingsButton.addTarget(self, action: #selector(makeRequest), for: .touchUpInside)
        settingsButton.setBackgroundImage(UIImage(named: "settings")?.withTintColor(.white), for: .normal)

        NSLayoutConstraint.activate([
            settingsButton.heightAnchor.constraint(equalToConstant: 30),
            settingsButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func configureStartGameButton() {
        startGamebutton.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
        startGameWithFriendButton.addTarget(self, action: #selector(startGameButtonTapped), for: .touchUpInside)
    }

    @objc
    private func startGameButtonTapped() {
        listener?.startGame()
    }

    @objc
    private func makeRequest() {

    }

    private func configureLeaderboard() {
        leaderboardContainerView.backgroundColor = .white
        leaderboardContainerView.layer.cornerRadius = 20

        leaderboardLabel.text = "Top players"
        leaderboardLabel.font = UIFont.boldSystemFont(ofSize: 20.0)

        firstPlaceImageView.contentMode = .scaleAspectFill
        firstPlaceImageView.layer.cornerRadius = 55
        firstPlaceImageView.layer.masksToBounds = false
        firstPlaceImageView.clipsToBounds = true
        firstPlaceImageView.image = UIImage(named: "avatar1")

        firstPlaceImageContainer.setCornerBorder(color: UIColor(named: "gold"), cornerRadius: 60, borderWidth: 2.5)

        NSLayoutConstraint.activate([
            firstPlaceImageView.heightAnchor.constraint(equalToConstant: 110),
            firstPlaceImageView.widthAnchor.constraint(equalToConstant: 110),

            firstPlaceImageContainer.heightAnchor.constraint(equalToConstant: 120),
            firstPlaceImageContainer.widthAnchor.constraint(equalToConstant: 120)
        ])

        firstPlaceResultLabel.text = "12 wins"
        firstPlaceNicknameLabel.text = "Bobrun"
        firstPlaceResultLabel.textColor = UIColor(named: "back")
        firstPlaceResultLabel.font = UIFont.systemFont(ofSize: 15)

        secondPlaceImageView.contentMode = .scaleAspectFill
        secondPlaceImageView.layer.cornerRadius = 45
        secondPlaceImageView.layer.masksToBounds = false
        secondPlaceImageView.clipsToBounds = true
        secondPlaceImageView.image = UIImage(named: "avatar2")

        secondPlaceImageContainer.setCornerBorder(color: UIColor(named: "silver"), cornerRadius: 50, borderWidth: 2.5)

        NSLayoutConstraint.activate([
            secondPlaceImageView.heightAnchor.constraint(equalToConstant: 90),
            secondPlaceImageView.widthAnchor.constraint(equalToConstant: 90),

            secondPlaceImageContainer.heightAnchor.constraint(equalToConstant: 100),
            secondPlaceImageContainer.widthAnchor.constraint(equalToConstant: 100)
        ])

        secondPlaceResultLabel.text = "10 wins"
        secondPlaceResultLabel.textColor = UIColor(named: "back")
        secondPlaceResultLabel.font = UIFont.systemFont(ofSize: 15)
        secondPlaceNicknameLabel.text = "Petrova"

        thirdPlaceImageView.contentMode = .scaleAspectFill
        thirdPlaceImageView.layer.cornerRadius = 35
        thirdPlaceImageView.layer.masksToBounds = false
        thirdPlaceImageView.clipsToBounds = true
        thirdPlaceImageView.image = UIImage(named: "avatar3")

        thirdPlaceImageContainer.setCornerBorder(color: UIColor(named: "bronze"), cornerRadius: 40, borderWidth: 2.5)

        NSLayoutConstraint.activate([
            thirdPlaceImageView.heightAnchor.constraint(equalToConstant: 70),
            thirdPlaceImageView.widthAnchor.constraint(equalToConstant: 70),

            thirdPlaceImageContainer.heightAnchor.constraint(equalToConstant: 80),
            thirdPlaceImageContainer.widthAnchor.constraint(equalToConstant: 80)
        ])

        thirdPlaceResultLabel.text = "7 wins"
        thirdPlaceResultLabel.textColor = UIColor(named: "back")
        thirdPlaceResultLabel.font = UIFont.systemFont(ofSize: 15)
        thirdPlaceNicknameLabel.text = "Berich"
    }

    private func applyColorScheme() {
        view.backgroundColor = UIColor(named: "back")
        nicknameLabel.textColor = .white

    }

    private func addSubviews() {
        avatarImageView = UIImageView()
        avatarContainerView = UIView()
        nicknameLabel = UILabel()
        qrCodeButton = UIButton()
        settingsButton = UIButton()
        leaderboardContainerView = UIView()
        leaderboardLabel = UILabel()
        firstPlaceImageView = UIImageView()
        firstPlaceResultLabel = UILabel()
        firstPlaceNicknameLabel = UILabel()
        firstPlaceImageContainer = UIView()
        secondPlaceImageView = UIImageView()
        secondPlaceResultLabel = UILabel()
        secondPlaceNicknameLabel = UILabel()
        secondPlaceImageContainer = UIView()
        thirdPlaceImageView = UIImageView()
        thirdPlaceResultLabel = UILabel()
        thirdPlaceNicknameLabel = UILabel()
        thirdPlaceImageContainer = UIView()
        startGamebutton = LoadingButton(text: "Start Game", textColor: UIColor(named: "back")!, font: UIFont.systemFont(ofSize: 20), bgColor: .white)
        startGameWithFriendButton = LoadingButton(text: "Start game with friend", textColor: UIColor(named: "back")!, font: UIFont.systemFont(ofSize: 20), bgColor: .white)

        let firstPlaceStackView = UIStackView()
        let secondPlaceStackView = UIStackView()
        let thirdPlaceStackView = UIStackView()
        let leaderbordHorizontalStackView = UIStackView()

        [
            avatarImageView,
            avatarContainerView,
            nicknameLabel,
            qrCodeButton,
            settingsButton,
            leaderboardContainerView,
            leaderboardLabel,
            firstPlaceImageView,
            firstPlaceResultLabel,
            firstPlaceNicknameLabel

        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        [
            secondPlaceImageView,
            secondPlaceResultLabel,
            secondPlaceNicknameLabel,
            thirdPlaceImageView,
            thirdPlaceResultLabel,
            thirdPlaceNicknameLabel,
            startGamebutton,
            startGameWithFriendButton,
            leaderbordHorizontalStackView
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        firstPlaceImageContainer.addSubview(firstPlaceImageView)
        secondPlaceImageContainer.addSubview(secondPlaceImageView)
        thirdPlaceImageContainer.addSubview(thirdPlaceImageView)

        NSLayoutConstraint.activate([
            firstPlaceImageView.centerXAnchor.constraint(equalTo: firstPlaceImageContainer.centerXAnchor),
            firstPlaceImageView.centerYAnchor.constraint(equalTo: firstPlaceImageContainer.centerYAnchor),

            secondPlaceImageView.centerXAnchor.constraint(equalTo: secondPlaceImageContainer.centerXAnchor),
            secondPlaceImageView.centerYAnchor.constraint(equalTo: secondPlaceImageContainer.centerYAnchor),

            thirdPlaceImageView.centerXAnchor.constraint(equalTo: thirdPlaceImageContainer.centerXAnchor),
            thirdPlaceImageView.centerYAnchor.constraint(equalTo: thirdPlaceImageContainer.centerYAnchor)
        ])

        firstPlaceStackView.axis = .vertical
        firstPlaceStackView.spacing = 10
        firstPlaceStackView.alignment = .center

        firstPlaceStackView.addArrangedSubview(firstPlaceImageContainer)
        firstPlaceStackView.addArrangedSubview(firstPlaceNicknameLabel)
        firstPlaceStackView.addArrangedSubview(firstPlaceResultLabel)

        secondPlaceStackView.axis = .vertical
        secondPlaceStackView.spacing = 10
        secondPlaceStackView.alignment = .center

        secondPlaceStackView.addArrangedSubview(secondPlaceImageContainer)
        secondPlaceStackView.addArrangedSubview(secondPlaceNicknameLabel)
        secondPlaceStackView.addArrangedSubview(secondPlaceResultLabel)

        thirdPlaceStackView.axis = .vertical
        thirdPlaceStackView.spacing = 10
        thirdPlaceStackView.alignment = .center

        thirdPlaceStackView.addArrangedSubview(thirdPlaceImageContainer)
        thirdPlaceStackView.addArrangedSubview(thirdPlaceNicknameLabel)
        thirdPlaceStackView.addArrangedSubview(thirdPlaceResultLabel)

        leaderbordHorizontalStackView.axis = .horizontal
        leaderbordHorizontalStackView.spacing = 10
        leaderbordHorizontalStackView.alignment = .lastBaseline

        leaderbordHorizontalStackView.addArrangedSubview(secondPlaceStackView)
        leaderbordHorizontalStackView.addArrangedSubview(firstPlaceStackView)
        leaderbordHorizontalStackView.addArrangedSubview(thirdPlaceStackView)


        leaderboardContainerView.addSubviews([leaderboardLabel,
                                              leaderbordHorizontalStackView
                                             ])

        avatarContainerView.addSubview(avatarImageView)
        
        view.addSubviews([avatarContainerView,
                          nicknameLabel,
                          qrCodeButton,
                          settingsButton,
                          leaderboardContainerView,
                          startGamebutton,
                          startGameWithFriendButton
                         ])

        NSLayoutConstraint.activate([
            qrCodeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            qrCodeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            settingsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            settingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            avatarContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            avatarContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            avatarImageView.centerYAnchor.constraint(equalTo: avatarContainerView.centerYAnchor),
            avatarImageView.centerXAnchor.constraint(equalTo: avatarContainerView.centerXAnchor),

            nicknameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10),
            nicknameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            leaderboardContainerView.topAnchor.constraint(equalTo: nicknameLabel.bottomAnchor, constant: 30),
            leaderboardContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            leaderboardLabel.topAnchor.constraint(equalTo: leaderboardContainerView.topAnchor, constant: 10),
            leaderboardLabel.leadingAnchor.constraint(equalTo: leaderboardContainerView.leadingAnchor, constant: 10),

            leaderbordHorizontalStackView.topAnchor.constraint(equalTo: leaderboardLabel.bottomAnchor, constant: 20),
            leaderbordHorizontalStackView.leadingAnchor.constraint(equalTo: leaderboardContainerView.leadingAnchor, constant: 20),
            leaderbordHorizontalStackView.trailingAnchor.constraint(equalTo: leaderboardContainerView.trailingAnchor, constant: -20),
            leaderbordHorizontalStackView.bottomAnchor.constraint(equalTo: leaderboardContainerView.bottomAnchor, constant: -20),

            startGamebutton.topAnchor.constraint(equalTo: leaderboardContainerView.bottomAnchor, constant: 80),
            startGamebutton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startGamebutton.heightAnchor.constraint(equalToConstant: 60),
            startGamebutton.widthAnchor.constraint(equalToConstant: 360),

            startGameWithFriendButton.topAnchor.constraint(equalTo: startGamebutton.bottomAnchor, constant: 20),
            startGameWithFriendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startGameWithFriendButton.heightAnchor.constraint(equalToConstant: 60),
            startGameWithFriendButton.widthAnchor.constraint(equalToConstant: 360),
        ])
    }

}

extension MainScreenViewController: MainScreenPresentable {

    func setViewModel(user: User?, leaderboardUsers: [User]) {
        var presentingUser: User = User.default
        var presentingLeaderboardUsers: [User] = []

        if let user = user {
            presentingUser = user
        }

        presentingLeaderboardUsers = leaderboardUsers
        presentingLeaderboardUsers.sort { firstUser, secondUser in
            firstUser.score > secondUser.score
        }

        for _ in (0..<3 - presentingLeaderboardUsers.count) {
            presentingLeaderboardUsers.append(User.default)
        }

        self.viewModel = .init(user: presentingUser, leaderboardUsers: presentingLeaderboardUsers)
    }

}

extension MainScreenViewController: MainScreenViewControllable {

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
