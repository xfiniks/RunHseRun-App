import UIKit

extension UIView {

    var isRightToLeftUI: Bool {
        return UIView.userInterfaceLayoutDirection(for: semanticContentAttribute) == .rightToLeft
    }

    var isLeftToRightUI: Bool {
        return UIView.userInterfaceLayoutDirection(for: semanticContentAttribute) == .leftToRight
    }

    func addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }

    func fadeTransition(_ duration: CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }

}
