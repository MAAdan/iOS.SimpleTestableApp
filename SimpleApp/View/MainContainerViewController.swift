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

        let menuViewController = MenuViewController(tabBarInfo: TabBarInfo(title: "Menu", imageName: "menu") )
        let sectionViewer = SectionViewerViewController(tabBarInfo: TabBarInfo(title: "Content", imageName: "news"))

        mainTabBarController = MainTabBarController(viewControllers: [sectionViewer, menuViewController])
        mainNavigationController = MainNavigationController(rootViewController: mainTabBarController)

        addChild(mainNavigationController)
        view.addSubview(mainNavigationController.view)
        mainNavigationController.didMove(toParent: self)
    }
}

