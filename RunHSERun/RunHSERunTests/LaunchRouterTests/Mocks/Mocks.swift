import RIBs
import UIKit
import RxSwift
import RxRelay

final class WindowMock: UIWindow {

    override var isKeyWindow: Bool {
        return internalIsKeyWindow
    }

    override var rootViewController: UIViewController? {
        get { return internalRootViewController }
        set { internalRootViewController = newValue }
    }

    private var internalIsKeyWindow: Bool = false
    private var internalRootViewController: UIViewController?

    override func makeKeyAndVisible() {
        internalIsKeyWindow = true
    }

}

final class ViewControllableMock: ViewControllable {

    let uiviewController = UIViewController(nibName: nil, bundle: nil)

}

class InteractableMock: Interactable {

    var isActive: Bool = false { didSet { isActiveSetCallCount += 1 } }
    var isActiveSetCallCount = 0
    var isActiveStreamSubject: PublishSubject<Bool> = PublishSubject<Bool>() { didSet { isActiveStreamSubjectSetCallCount += 1 } }
    var isActiveStreamSubjectSetCallCount = 0
    var isActiveStream: Observable<Bool> { return isActiveStreamSubject }


    var activateHandler: (() -> ())?
    var activateCallCount: Int = 0
    var deactivateHandler: (() -> ())?
    var deactivateCallCount: Int = 0

    init() {}

    func activate() {
        activateCallCount += 1
        if let activateHandler = activateHandler {
            return activateHandler()
        }
    }

    func deactivate() {
        deactivateCallCount += 1
        if let deactivateHandler = deactivateHandler {
            return deactivateHandler()
        }
    }

}
