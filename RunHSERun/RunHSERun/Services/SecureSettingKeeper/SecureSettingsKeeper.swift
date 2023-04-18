
final class SecureSettingsKeeper {

    @Token("authToken")
    var authToken: String?

    func clear() {
        authToken = nil
    }

}
