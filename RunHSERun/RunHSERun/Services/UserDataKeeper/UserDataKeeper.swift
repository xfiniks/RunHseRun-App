import Foundation

protocol UserDataKeeper: AnyObject {

    func setUserEmail(email: String)
    func getUserEmail() -> String?

    func setUserNickname(nickname: String)
    func getUserNickname() -> String?

}

// MARK: - Implementation

final class UserDataKeeperImpl: UserDataKeeper {

    // MARK: - Private Properties

    private let userDefaults: UserDefaults

    // MARK: - Init

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    // MARK: - Internal Methods

    func getUserEmail() -> String? {
        userDefaults.string(forKey: "email")
    }

    func setUserEmail(email: String) {
        userDefaults.setValue(email, forKey: "email")
    }

    func getUserNickname() -> String? {
        userDefaults.string(forKey: "nickname")
    }

    func setUserNickname(nickname: String) {
        userDefaults.setValue(nickname, forKey: "nickname")
    }

}
