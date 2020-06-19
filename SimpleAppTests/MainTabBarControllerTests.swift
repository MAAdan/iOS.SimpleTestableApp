//
//  Created on 18/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
@testable import SimpleApp

class MainTabBarControllerTests: XCTestCase {

    func testThatHasTwoTabs() throws {
        let viewControllers = [BarTabableMock(tabTitle: "", tabImageName: ""), BarTabableMock(tabTitle: "", tabImageName: "")]
        let tabBarController = MainTabBarController(viewControllers: viewControllers)
        XCTAssertEqual(tabBarController.viewControllers?.count, viewControllers.count)
    }

    func testThatTabImagesExists() {
        XCTAssertNotNil(UIImage(named: TabBarType.menu.imageName, in: Bundle.main, compatibleWith: nil))
        XCTAssertNotNil(UIImage(named: TabBarType.news.imageName, in: Bundle.main, compatibleWith: nil))
    }
}

extension MainTabBarControllerTests {
    class BarTabableMock: UIViewController, BarTabable {
        required init(tabTitle: String, tabImageName: String) {
            super.init(nibName: nil, bundle: nil)
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
