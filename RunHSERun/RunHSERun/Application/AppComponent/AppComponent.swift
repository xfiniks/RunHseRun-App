import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
    
    var authManager: AuthManager
    var secureSettingsKeeper: SecureSettingsKeeper

    init() {
        secureSettingsKeeper = SecureSettingsKeeper()
        let userDataKeeper = UserDataKeeperImpl()
        let GRPCChannelProvider = GRPCChannelProvider()
        let authService = AuthService(grpcChannel: GRPCChannelProvider.grpcChannel)
        authManager = AuthManager(userDataKeeper: userDataKeeper, authService: authService, secureSettingsKeeper: secureSettingsKeeper)
        super.init(dependency: EmptyComponent())
    }

}
