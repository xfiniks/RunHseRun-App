import UIKit
import FloatingTabBarController

final class BarScreenViewController: FloatingTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let viewControllers = [UINavigationController(
            rootViewController: iMessageChatChannelListViewController()), MainScreenViewController(), RegistrationViewController()]

        let selected = [
                        UIImage(named: "Chat" + "_Large")!,
                        UIImage(named: "Game" + "_Large")!,
                        UIImage(named: "Friends" + "_Large")!]

        let normal = [
                      UIImage(named: "Chat" + "_Small")!,
                      UIImage(named: "Game" + "_Small")!,
                      UIImage(named: "Friends" + "_Small")!]

        let titles = ["Chat", "Game", "Friends"]


        self.viewControllers = [0, 1, 2].map {
            viewControllers[$0].title = titles[$0]
            viewControllers[$0].floatingTabItem = FloatingTabItem(selectedImage: selected[$0], normalImage: normal[$0])
            return viewControllers[$0]
        }

    }

}
