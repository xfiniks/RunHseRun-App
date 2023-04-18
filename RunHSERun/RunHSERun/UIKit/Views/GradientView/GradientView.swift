import UIKit

open class GradientView: UIView {

    // MARK: - Public types

    public enum CornerRadius {
        case none
        case standard
        case custom(CGFloat)
    }

    // MARK: - Private types

    private enum Constants {

        static var standardCornerRadius: CGFloat {
            return 12.0
        }

    }

    // MARK: - Public properties

    public override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    // MARK: - Private properties

    private var gradientLayer: CAGradientLayer? {
        guard let gradientLayer = layer as? CAGradientLayer else {
            assertionFailure("View's layer is not 'CAGradientLayer'. Layer: \(layer)")
            return nil
        }
        return gradientLayer
    }

    // MARK: - Internal methods

    func configureGradient(ofType gradient: Gradient, cornerRadius: CornerRadius = .none) {
        gradientLayer?.configure(with: gradient)
        if isRightToLeftUI {
            gradientLayer?.mirrorDirectionRightLeft()
        }

        switch cornerRadius {
        case .none:
            gradientLayer?.cornerRadius = 0.0

        case .standard:
            gradientLayer?.cornerRadius = Constants.standardCornerRadius

        case .custom(let customRadius):
            gradientLayer?.cornerRadius = customRadius
        }
    }

}
