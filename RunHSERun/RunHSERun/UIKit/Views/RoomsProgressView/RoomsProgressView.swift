import UIKit

final class RoomsProgressView: UIView {

    private enum Constants {

        static let sectionWidth: CGFloat = 70
        static let sectionHeight: CGFloat = 2

        static let circleHeight: CGFloat = 30
    }

    private var sections: [UIView] = []
    private var circles: [UIView] = []
    private var timerLabels: [UILabel] = []

    private var currentStage: Int = 0
    private var numberOfStages: Int

    required init(numberOfStages: Int){
        self.numberOfStages = numberOfStages
        
        super.init(frame: .zero)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setSectionCompleted(time: String) {
        guard currentStage < numberOfStages else {
            return
        }

        UIView.animate(withDuration: 1.5) { [weak self] in
            guard let self = self else { return }

            self.sections[self.currentStage].backgroundColor = UIColor(named: "mint")
            self.circles[self.currentStage].backgroundColor = UIColor(named: "mint")
            self.timerLabels[self.currentStage].textColor = UIColor(named: "mint")
        }

        timerLabels[currentStage].fadeTransition(1.5)
        timerLabels[currentStage].text = time

        if currentStage != numberOfStages - 1 {
            timerLabels[currentStage + 1].fadeTransition(1.5)
            timerLabels[currentStage + 1].text = "run!"
        }

        self.currentStage += 1
    }

    private func configure() {
        (0..<numberOfStages).forEach { _ in
            sections.append(UIView())
        }

        (0..<numberOfStages).forEach { _ in
            let circle = UIView()
            circle.layer.cornerRadius = Constants.circleHeight / 2
            circle.clipsToBounds = true
            circles.append(circle)
        }

        (0..<numberOfStages).forEach { _ in
            let label = UILabel()
            label.font = .systemFont(ofSize: 15)
            timerLabels.append(label)
        }

        configureConstraints()
        configureColorScheme()
        configureStartStage()
    }

    private func configureConstraints() {
        (0..<sections.count).forEach {
            let section = sections[$0]
            section.translatesAutoresizingMaskIntoConstraints = false
            addSubview(section)

            let circle = circles[$0]
            circle.translatesAutoresizingMaskIntoConstraints = false
            addSubview(circle)

            let label = timerLabels[$0]
            label.translatesAutoresizingMaskIntoConstraints = false
            addSubview(label)

            let leadingAnchor = $0 == 0 ?
            section.leadingAnchor.constraint(equalTo: leadingAnchor) :
            section.leadingAnchor.constraint(equalTo: circles[$0 - 1].trailingAnchor)

            NSLayoutConstraint.activate([
                section.widthAnchor.constraint(equalToConstant: Constants.sectionWidth),
                section.heightAnchor.constraint(equalToConstant: Constants.sectionHeight),
                leadingAnchor,

                label.bottomAnchor.constraint(equalTo: section.topAnchor),
                label.centerXAnchor.constraint(equalTo: section.centerXAnchor),

                circle.widthAnchor.constraint(equalToConstant: Constants.circleHeight),
                circle.heightAnchor.constraint(equalToConstant: Constants.circleHeight),
                circle.leadingAnchor.constraint(equalTo: section.trailingAnchor),
                circle.centerYAnchor.constraint(equalTo: section.centerYAnchor),

                widthAnchor.constraint(equalToConstant: 300)
            ])
            
        }
    }

    private func configureColorScheme() {
        (0..<sections.count).forEach {
            let section = sections[$0]
            section.backgroundColor = .lightGray

            let circle = circles[$0]
            circle.backgroundColor = .lightGray

            let label = timerLabels[$0]
            label.textColor = .white
        }
    }

    private func configureStartStage() {
        timerLabels[0].text = "run!"
    }

}
