import UIKit

extension UIColor {

    public convenience init?(hexRgba hex: String) {
        guard let code = UInt(hex, radix: 16) else {
            return nil
        }
        self.init(hexRgba: code)
    }

    public convenience init(hexRgba hex: UInt) {
        self.init(red: CGFloat((hex & 0xFF000000) >> 24) / 255.0,
                  green: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
                  blue: CGFloat((hex & 0xFF00) >> 8) / 255.0,
                  alpha: CGFloat(hex & 0xFF) / 255.0)
    }

}
