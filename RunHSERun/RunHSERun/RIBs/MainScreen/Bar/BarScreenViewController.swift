import UIKit
import FloatingTabBarController

final class BarScreenViewController: FloatingTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let viewControllers = [RegistrationViewController(), MainScreenViewController(), UINavigationController(
            rootViewController: iMessageChatChannelListViewController()
        )]
        let selected = [UIImage(named: "Friends" + "_Large")!,
                        UIImage(named: "Game" + "_Large")!,
                        UIImage(named: "Chat" + "_Large")!]

        let normal = [UIImage(named: "Friends" + "_Small")!,
                      UIImage(named: "Game" + "_Small")!,
                      UIImage(named: "Chat" + "_Small")!]

        let titles = ["Friends", "Game", "Chat"]


        self.viewControllers = [0, 1, 2].map {
            viewControllers[$0].title = titles[$0]
            viewControllers[$0].floatingTabItem = FloatingTabItem(selectedImage: selected[$0], normalImage: normal[$0])
            return viewControllers[$0]
        }

    }

}
