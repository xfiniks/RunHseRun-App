//
//  GameInteractor.swift
//  RunHSERun
//
//  Created by Ivan Chernykh on 17.04.2023.
//

import RIBs
import RxSwift

protocol GameRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol GamePresentable: Presentable {
    var listener: GamePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol GameListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class GameInteractor: PresentableInteractor<GamePresentable>, GameInteractable, GamePresentableListener {

    weak var router: GameRouting?
    weak var listener: GameListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: GamePresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
