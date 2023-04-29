import RIBs

/// The dependencies needed from the parent scope of Main to provide for the Game scope.
// TODO: Update MainDependency protocol to inherit this protocol.
protocol MainDependencyGame: Dependency {
    // TODO: Declare dependencies needed from the parent scope of Main to provide dependencies
    // for the Game scope.
    var streamManager: StreamManager { get }
    var gameManager: GameManager { get }
}

extension MainComponent: GameDependency {

    var streamManager: StreamManager {
        dependency.streamManager
    }

    var gameManager: GameManager {
        dependency.gameManager
    }

}
