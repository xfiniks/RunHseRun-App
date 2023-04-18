import UIKit

enum Gradient {

    var startPoint: CGPoint {
        return CGPoint(x: 0, y: 0)
    }

    var endPoint: CGPoint {
        return CGPoint(x: 0, y: 1)
    }

    var colors: [UIColor] {
        return [
            UIColor(hexRgba: 0x2EAAFAFF),
            UIColor(hexRgba: 0x1F2F98FF)
//            UIColor(hexRgba: 0xFFFFFFFF),
//            UIColor(hexRgba: 0x8B3C7FFF)
//            UIColor(hexRgba: 0x7FFFD4FF)
//            UIColor(hexRgba: 0x2325BDFF),
//            UIColor(hexRgba: 0xFFFFFFFF)
        ]
    }

    case main

}
