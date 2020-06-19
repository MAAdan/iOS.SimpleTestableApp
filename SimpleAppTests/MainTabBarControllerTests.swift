//
//  Created on 18/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
@testable import SimpleApp

class MainTabBarControllerTests: XCTestCase {

    func testThatHasTwoTabs() throws {
        let viewControllers = [BarTabableMock(tabBarInfo: TabBarInfo(title: "", imageName: "")), BarTabableMock(tabBarInfo: TabBarInfo(title: "", imageName: ""))]
        let tabBarController = MainTabBarController(viewControllers: viewControllers)
        XCTAssertEqual(tabBarController.viewControllers?.count, viewControllers.count)
    }
}

extension MainTabBarControllerTests {
    class BarTabableMock: UIViewController, BarTabable {
        required init(tabBarInfo: TabBarInfo) {
            super.init(nibName: nil, bundle: nil)
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
