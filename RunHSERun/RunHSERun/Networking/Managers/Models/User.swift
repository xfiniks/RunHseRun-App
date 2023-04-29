import UIKit

struct User: Equatable {

    let score: Int
    let nickname: String
    let image: UIImage
    let id: Int

}

extension User {

    init(networkUser: Run_Hse_Run_User) {
        score = Int(networkUser.score)
        nickname = networkUser.nickname
        image = UIImage(base64String: networkUser.image) ?? UIImage(named: "avatar")!
        id = Int(networkUser.id)
    }

    static var `default`: User {
        User(score: 0, nickname: "xfiniks", image: UIImage(named: "avatar")!, id: 0)
    }

}
