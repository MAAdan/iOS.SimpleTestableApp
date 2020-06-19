//
//  Created on 18/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest

class MainTabBarControllerTests: XCTestCase {

    func testThatHasTwoTabs() throws {
        let viewControllers = [UIViewController(), UIViewController()]
        let tabBarController = MainTabBarController(viewControllers: viewControllers)
    }
}
