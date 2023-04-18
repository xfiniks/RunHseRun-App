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
    func replaceModal(viewController: ViewControllable?)
    func setViewModel(viewModel:GameViewModel)
}

protocol WaitingScreenViewControllable: ViewControllable {
    func replaceModal(viewController: ViewControllable?)
}

protocol FindAudienceViewControllable: ViewControllable {
    func replaceModal(viewController: ViewControllable?)
    func setViewModel(viewModel: FindAudienceViewModel)
}

protocol GameResultViewControllable: ViewControllable {
    func replaceModal(viewController: ViewControllable?)
    func setViewModel(viewModel: GameResultViewModel)
}

final class GameRouter: ViewableRouter<GameInteractable, GameViewControllable> {

//    private let gameViewController: GameViewControllable!
//    private let waitingScreenViewController: WaitingScreenViewControllable!
//    private let gameResultsViewControler: GameResultViewControllable!
//    private let findAudienceViewController: FindAudienceViewControllable!

//    private var currentViewController: ViewControllable


    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: GameInteractable,
         viewController: GameViewController) {
//        self.gameViewController = viewController
//        self.waitingScreenViewController = waitingScreenViewController
//        self.gameResultsViewControler = gameResultsViewControler
//        self.findAudienceViewController = findAudienceViewController
//        currentViewController = findAudienceViewController

        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

extension GameRouter: GameRouting {

    func moveToGame(audiences: [String], currentAudience: Int, completion: @escaping (PredictResult) -> Void) {
//        let vc = currentViewController as? WaitingScreenViewControllable
//
//        guard let vc = vc else {
//            return
//        }
//
//        gameViewController.setViewModel(viewModel: .init(audiences: audiences, currentAudience: currentAudience, completion: completion))
//        vc.replaceModal(viewController: gameViewController)
//        currentViewController = gameViewController
    }

    func moveToWaiting() {
//        let vc = currentViewController as? FindAudienceViewControllable
//
//        guard let vc = vc else {
//            return
//        }
//
//        vc.replaceModal(viewController: waitingScreenViewController)
//        currentViewController = waitingScreenViewController
    }

    func moveToResults(result: String, opponent: String) {
//        let vc = currentViewController as? GameViewControllable
//
//        guard let vc = vc else {
//            return
//        }
//
//        gameResultsViewControler.setViewModel(viewModel: .init(result: result, opponent: opponent))
//        vc.replaceModal(viewController: gameResultsViewControler)
//        currentViewController = gameResultsViewControler
    }

}
