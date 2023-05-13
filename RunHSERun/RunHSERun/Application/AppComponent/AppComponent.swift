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
        secureSettingsKeeper = SecureSettingsKeeperImpl()
        userDataKeeper = UserDataKeeperImpl()

        let GRPCChannelProvider = GRPCChannelProvider()

        let authService = AuthService(grpcChannel: GRPCChannelProvider.grpcChannel)
        authManager = AuthManagerImpl(userDataKeeper: userDataKeeper, authService: authService, secureSettingsKeeper: secureSettingsKeeper)
        let userService = UserService(grpcChannel: GRPCChannelProvider.grpcChannel)
        userManager =  UserManagerImpl(userService: userService, secureSettingsKeeper: secureSettingsKeeper)
        let friendsService = FriendsService(grpcChannel: GRPCChannelProvider.grpcChannel)
        friendsManager = FriendsManagerImpl(friendsService: friendsService, secureSettingsKeeper: secureSettingsKeeper)
        let stream = GRPCStream(grpcChannel: GRPCChannelProvider.grpcChannel)
        streamManager = StreamManagerImpl(stream: stream, secureSettingsKeeper: secureSettingsKeeper)
        let gameService = GameService(grpcChannel: GRPCChannelProvider.grpcChannel)
        gameManager = GameManagerImpl(gameService: gameService, secureSettingsKeeper: secureSettingsKeeper)

        super.init(dependency: EmptyComponent())
    }

}
