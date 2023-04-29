import RIBs

/// The dependencies needed from the parent scope of Root to provide for the Authorization scope.
// TODO: Update RootDependency protocol to inherit this protocol.
protocol RootDependencyAuthorization: Dependency {
    // TODO: Declare dependencies needed from the parent scope of Root to provide dependencies
    // for the Authorization scope.
    var authManager: AuthManager { get }
}

extension RootComponent: AuthorizationDependency {

    // TODO: Implement properties to provide for Authorization scope.
    var authManager: AuthManager {
        dependency.authManager
    }
}
