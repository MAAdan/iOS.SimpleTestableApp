//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import UIKit

class MainContainerViewController: UIViewController {

    private var mainNavigationController: MainNavigationController!
    private var mainTabBarController: MainTabBarController!

    override func viewDidLoad() {
        super.viewDidLoad()

        let menuViewController = MenuViewController(tabTitle: TabBarType.menu.title, tabImageName: TabBarType.menu.imageName)
        let sectionViewer = SectionViewerViewController(tabTitle: TabBarType.news.title, tabImageName: TabBarType.news.imageName)

        mainTabBarController = MainTabBarController(viewControllers: [sectionViewer, menuViewController])
        mainNavigationController = MainNavigationController(rootViewController: mainTabBarController)

        addChild(mainNavigationController)
        view.addSubview(mainNavigationController.view)
        mainNavigationController.didMove(toParent: self)
    }
}
