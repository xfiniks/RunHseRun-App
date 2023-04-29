import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {

    var authManager: AuthManager
    var secureSettingsKeeper: SecureSettingsKeeper
    var userManager: UserManager
    var friendsManager: FriendsManager
    var userDataKeeper: UserDataKeeper
    var streamManager: StreamManager
    var gameManager: GameManager

    init() {
        secureSettingsKeeper = SecureSettingsKeeper()
        userDataKeeper = UserDataKeeperImpl()

        let GRPCChannelProvider = GRPCChannelProvider()

        let authService = AuthService(grpcChannel: GRPCChannelProvider.grpcChannel)
        authManager = AuthManager(userDataKeeper: userDataKeeper, authService: authService, secureSettingsKeeper: secureSettingsKeeper)
        let userService = UserService(grpcChannel: GRPCChannelProvider.grpcChannel)
        userManager =  UserManager(userService: userService, secureSettingsKeeper: secureSettingsKeeper)
        let friendsService = FriendsService(grpcChannel: GRPCChannelProvider.grpcChannel)
        friendsManager = FriendsManager(friendsService: friendsService, secureSettingsKeeper: secureSettingsKeeper)
        let stream = GRPCStream(grpcChannel: GRPCChannelProvider.grpcChannel)
        streamManager = StreamManagerImpl(stream: stream, secureSettingsKeeper: secureSettingsKeeper)
        let gameService = GameService(grpcChannel: GRPCChannelProvider.grpcChannel)
        gameManager = GameManager(gameService: gameService, secureSettingsKeeper: secureSettingsKeeper)

        super.init(dependency: EmptyComponent())
    }

}
