import UIKit

final class AudienceCell: UITableViewCell {

    // MARK: - Internal Types

    typealias ViewModel = FindAudienceViewModel.Row

    // MARK: - Private Types

    private enum Constants {

        enum Margins {

            static let content: NSDirectionalEdgeInsets = {
                let upInset: CGFloat = 16
                return NSDirectionalEdgeInsets(top: upInset, leading: .zero, bottom: .zero, trailing: .zero)
            }()

        }

    }

    // MARK: - Internal Static Properties

    static var reuseID: String { "\(self)" }

    // MARK: - Private Properties

    private let filledContainerView = UIView()
    private let titleLabel = UILabel()
    private var id = 0

    var completion: (() -> Void)?

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    // MARK: - Internal Methods

    func configure(with viewModel: ViewModel) {
        titleLabel.font = .systemFont(ofSize: 30)
        titleLabel.text = viewModel.title

        id = viewModel.id
    }

    func apply() {
        filledContainerView.backgroundColor = .white
        titleLabel.textColor = UIColor(named: "back")
    }

    // MARK: - Private Methods

    private func commonInit() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.preservesSuperviewLayoutMargins = false
        contentView.directionalLayoutMargins = Constants.Margins.content
        configureSubviews()

        titleLabel.isUserInteractionEnabled = true
        titleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
    }

    @objc
    private func tap() {
        completion!()
    }

    private func configureSubviews() {
        filledContainerView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        filledContainerView.addSubview(titleLabel)
        contentView.addSubview(filledContainerView)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: filledContainerView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: filledContainerView.centerYAnchor),

            filledContainerView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            filledContainerView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            filledContainerView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            filledContainerView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            filledContainerView.heightAnchor.constraint(equalToConstant: 50)
        ])

    }

}
