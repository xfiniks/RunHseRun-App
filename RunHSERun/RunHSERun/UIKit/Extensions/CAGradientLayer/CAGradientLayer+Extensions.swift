import UIKit

extension CAGradientLayer {

    func mirrorDirectionRightLeft() {
        let mirrorStart = CGPoint(x: endPoint.x, y: startPoint.y)
        let mirrorEnd = CGPoint(x: startPoint.x, y: endPoint.y)
        self.startPoint = mirrorStart
        self.endPoint = mirrorEnd
    }

    func configure(with gradient: Gradient) {
        colors = gradient.colors.map { $0.cgColor }
        startPoint = gradient.startPoint
        endPoint = gradient.endPoint
    }
}
