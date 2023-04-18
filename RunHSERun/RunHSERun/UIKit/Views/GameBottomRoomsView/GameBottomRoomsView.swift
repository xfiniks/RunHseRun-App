import UIKit

final class GameBottomRoomsView: UIView {

    private enum Constants {

        static let bottomLineViewHeight: CGFloat = 1

        static let circleHeight: CGFloat = 20

    }

    private var bottomLineView = UIView()
    private var leftCircleView = UIView()
    private var rightCircleView = UIView()
    private var leftLabel = UILabel()
    private var rightLabel = UILabel()

    private var leftRoom: String
    private var rightRoom: String

    required init(leftRoom: String, rightRoom: String){
        self.leftRoom = leftRoom
        self.rightRoom = rightRoom

        super.init(frame: .zero)
        configure()
        configureColorScheme()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setNewRooms(leftRoom: String, rightRoom: String) {
        UIView.animate(withDuration: 1.5) { [weak self] in
            self?.leftLabel.text = leftRoom
            self?.rightLabel.text = rightRoom
        }

        leftLabel.fadeTransition(1.5)
        rightLabel.fadeTransition(1.5)
        leftLabel.text = leftRoom
        rightLabel.text = rightRoom
    }

    private func configure() {
        leftLabel.text = leftRoom
        leftLabel.font = .systemFont(ofSize: 13)

        rightLabel.text = rightRoom
        rightLabel.font = .systemFont(ofSize: 13)

        leftCircleView.layer.cornerRadius = Constants.circleHeight / 2
        leftCircleView.clipsToBounds = true

        rightCircleView.layer.cornerRadius = Constants.circleHeight / 2
        rightCircleView.clipsToBounds = true

        [
            bottomLineView,
            leftLabel,
            rightLabel,
            leftCircleView,
            rightCircleView,
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        addSubviews([bottomLineView,
                    leftCircleView,
                    rightCircleView,
                    leftLabel,
                    rightLabel])

        NSLayoutConstraint.activate([
            bottomLineView.centerYAnchor.constraint(equalTo: centerYAnchor),
            bottomLineView.heightAnchor.constraint(equalToConstant: Constants.bottomLineViewHeight),
            bottomLineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLineView.trailingAnchor.constraint(equalTo: trailingAnchor),

            leftCircleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            leftCircleView.centerYAnchor.constraint(equalTo: bottomLineView.centerYAnchor),
            leftCircleView.heightAnchor.constraint(equalToConstant: Constants.circleHeight),
            leftCircleView.widthAnchor.constraint(equalToConstant: Constants.circleHeight),

            leftLabel.centerXAnchor.constraint(equalTo: leftCircleView.centerXAnchor),
            leftLabel.bottomAnchor.constraint(equalTo: leftCircleView.topAnchor, constant: -5),

            rightCircleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            rightCircleView.centerYAnchor.constraint(equalTo: bottomLineView.centerYAnchor),
            rightCircleView.heightAnchor.constraint(equalToConstant: Constants.circleHeight),
            rightCircleView.widthAnchor.constraint(equalToConstant: Constants.circleHeight),

            rightLabel.centerXAnchor.constraint(equalTo: rightCircleView.centerXAnchor),
            rightLabel.bottomAnchor.constraint(equalTo: rightCircleView.topAnchor, constant: -5),

            heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func configureColorScheme() {
        bottomLineView.backgroundColor = .white
        leftCircleView.backgroundColor = .white
        rightCircleView.backgroundColor = .white
        leftLabel.textColor = .white
        rightLabel.textColor = .white
    }

}
