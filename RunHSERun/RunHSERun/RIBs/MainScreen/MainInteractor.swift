//
//  MainInteractor.swift
//  RunHSERun
//
//  Created by Ivan Chernykh on 17.04.2023.
//

import RIBs
import RxSwift

protocol MainRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
//    func moveToGame(info: Run_Hse_Run_GameInfo)
//    func moveToResults(result: String)
    
}

protocol MainPresentable: Presentable {
    var listener: MainPresentableListener? { get set }
    
}

protocol MainScreenPresentable: Presentable {
    var listener: MainScreenPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol MainListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class MainInteractor: PresentableInteractor<MainPresentable>, MainInteractable, MainPresentableListener {

    weak var router: MainRouting?
    weak var listener: MainListener?

    private var streamManager: StreamManager?
    private var gameManager: GameManager?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: MainPresentable) {


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

extension MainInteractor: MainScreenPresentableListener {

    func startGame() {
//        streamManager.startGame { [weak self] result in
//            switch result {
//            case .success(let response):
//                switch response {
//                case .gameInfo(let info):
//                    self?.router?.moveToGame(info: info)
//
//                case .gameResult(let result):
//                    let vc
//
//                }
//
//            case .failure(let error):
//                print(error)
//            }
//        }
    }

}
