//
//  GameRouter.swift
//  RunHSERun
//
//  Created by Ivan Chernykh on 17.04.2023.
//

import RIBs

protocol GameInteractable: Interactable {
    var router: GameRouting? { get set }
    var listener: GameListener? { get set }
}

protocol GameViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class GameRouter: ViewableRouter<GameInteractable, GameViewControllable>, GameRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: GameInteractable, viewController: GameViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
