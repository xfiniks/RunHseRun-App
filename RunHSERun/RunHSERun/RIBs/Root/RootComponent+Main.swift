import RIBs

/// The dependencies needed from the parent scope of Root to provide for the Main scope.
// TODO: Update RootDependency protocol to inherit this protocol.
protocol RootDependencyMain: Dependency {
    // TODO: Declare dependencies needed from the parent scope of Root to provide dependencies
    // for the Main scope.
    var userManager: UserManager { get }
    var friendsManager: FriendsManager { get }
    var streamManager: StreamManager { get }
    var gameManager: GameManager { get }
    var userDataKeeper: UserDataKeeper { get }

}

extension RootComponent: MainDependency {

    var streamManager: StreamManager {
        dependency.streamManager
    }

    var gameManager: GameManager {
        dependency.gameManager
    }

    var userManager: UserManager {
        dependency.userManager
    }

    var friendsManager: FriendsManager {
        dependency.friendsManager
    }

    var userDataKeeper: UserDataKeeper {
        dependency.userDataKeeper
    }

}
