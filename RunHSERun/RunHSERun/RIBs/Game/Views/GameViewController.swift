import RIBs
import RxSwift
import UIKit
import MHLoadingButton

protocol GamePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func validateImage(image: UIImage)
}

final class GameViewController: UIViewController, GamePresentable {

    weak var listener: GamePresentableListener?

    private var roomDescriptionLabel: UILabel!
    private var roomLabel: UILabel!
    private var timeDescriptionLabel: UILabel!
    private var timeContainerView: UIView!
    private var timeLabel: UILabel!
    private var roomsProgressView: RoomsProgressView!
    private var gameBottomRoomsView: GameBottomRoomsView!
    private var makePhotoButton: LoadingButton!
    private var imagePicker: ImagePicker!

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
        configureRoomDescriptionLabel()
        configureRoomLabel()
        configureTimeDescriptionLabel()
        configureTimeContainerView()
        configureTimeLabel()
        configureRoomsProgressView()
        configureGameBottomRoomsView()
        configureMakePhotoButton()

        imagePicker = ImagePicker(presentationController: self, delegate: self)
    }

    private func configureRoomDescriptionLabel() {
        roomDescriptionLabel.text = "your next room is"
        roomDescriptionLabel.font = .systemFont(ofSize: 13)
    }

    private func configureRoomLabel() {
        roomLabel.text = "N506"
        roomLabel.font = .boldSystemFont(ofSize: 70)
    }

    private func configureTimeDescriptionLabel() {
        timeDescriptionLabel.text = "your summary time is"
        timeDescriptionLabel.font = .systemFont(ofSize: 13)
    }

    private func configureTimeContainerView() {
        timeContainerView.layer.cornerRadius = 8
        timeContainerView.clipsToBounds = true
    }

    private func configureTimeLabel() {
        timeLabel.text = "00:17"
        timeLabel.font = .boldSystemFont(ofSize: 70)
    }

    private func configureRoomsProgressView() {

    }

    private func configureGameBottomRoomsView() {

    }

    private func configureMakePhotoButton() {
        makePhotoButton.addTarget(self, action: #selector(setNewStage), for: .touchUpInside)
    }

    private func applyColorScheme() {
        view.backgroundColor = UIColor(named: "back")
        roomDescriptionLabel.textColor = .white
        roomLabel.textColor = .white
        timeDescriptionLabel.textColor = .white
        timeContainerView.backgroundColor = .white
        timeLabel.textColor = UIColor(named: "back")
    }

    private func addSubviews() {
        roomDescriptionLabel = UILabel()
        roomLabel = UILabel()
        timeDescriptionLabel = UILabel()
        timeContainerView = UIView()
        timeLabel = UILabel()
        roomsProgressView = RoomsProgressView(numberOfStages: 3)
        gameBottomRoomsView = GameBottomRoomsView(leftRoom: "S051", rightRoom: "N506")
        makePhotoButton = LoadingButton(text: "Make photo",
                                        textColor: UIColor(named: "back")!,
                                        font: UIFont.systemFont(ofSize: 15),
                                        bgColor: .white)
        [
            roomDescriptionLabel,
            roomLabel,
            timeDescriptionLabel,
            timeContainerView,
            timeLabel,
            roomsProgressView,
            gameBottomRoomsView,
            makePhotoButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        timeContainerView.addSubview(timeLabel)

        view.addSubviews([
            roomDescriptionLabel,
            roomLabel,
            timeDescriptionLabel,
            timeContainerView,
            roomsProgressView,
            gameBottomRoomsView,
            makePhotoButton
        ])

        NSLayoutConstraint.activate([
            roomsProgressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            roomsProgressView.leadingAnchor.constraint(equalTo: view.leadingAnchor),

            roomDescriptionLabel.topAnchor.constraint(equalTo: roomsProgressView.bottomAnchor, constant: 50),
            roomDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            roomLabel.topAnchor.constraint(equalTo: roomDescriptionLabel.bottomAnchor),
            roomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            timeDescriptionLabel.topAnchor.constraint(equalTo: roomLabel.bottomAnchor, constant: 75),
            timeDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            timeContainerView.topAnchor.constraint(equalTo: timeDescriptionLabel.bottomAnchor, constant: 5),
            timeContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeContainerView.heightAnchor.constraint(equalToConstant: 125),
            timeContainerView.widthAnchor.constraint(equalToConstant: 300),

            timeLabel.centerXAnchor.constraint(equalTo: timeContainerView.centerXAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: timeContainerView.centerYAnchor),

            gameBottomRoomsView.topAnchor.constraint(equalTo: timeContainerView.bottomAnchor, constant: 100),
            gameBottomRoomsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gameBottomRoomsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            makePhotoButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            makePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            makePhotoButton.heightAnchor.constraint(equalToConstant: 50),
            makePhotoButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }

    @objc
    private func setNewStage() {
        gameBottomRoomsView.setNewRooms(leftRoom: "R506", rightRoom: "D201")
        roomsProgressView.setSectionCompleted(time: "00:20")

        configureRoomsProgressView()
    }

    func setViewModel(room: String) {
        roomDescriptionLabel.text = room
    }
    
}

extension GameViewController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        guard let image = image else {
            return
        }

        listener?.validateImage(image: image)

    }

}

extension GameViewController: GameViewControllable {

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
