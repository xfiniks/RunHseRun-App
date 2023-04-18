//
//  GameBuilder.swift
//  RunHSERun
//
//  Created by Ivan Chernykh on 17.04.2023.
//

import RIBs

protocol GameDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class GameComponent: Component<GameDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol GameBuildable: Buildable {
    func build(withListener listener: GameListener) -> GameRouting
}

final class GameBuilder: Builder<GameDependency>, GameBuildable {

    override init(dependency: GameDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: GameListener) -> GameRouting {
        let component = GameComponent(dependency: dependency)
        let viewController = GameViewController()
        let interactor = GameInteractor(presenter: viewController)
        interactor.listener = listener
        return GameRouter(interactor: interactor, viewController: viewController)
    }
}
