//
//  Created on 18/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
@testable import SimpleApp

class MainTabBarControllerTests: XCTestCase {

    var tabBarController: MainTabBarController!

    override func setUp() {
        let viewControllers = [MockBarTabable(tabTitle: "", tabImageName: ""), MockBarTabable(tabTitle: "", tabImageName: "")]
        tabBarController = MainTabBarController(viewControllers: viewControllers)
    }

    func testThatHasTwoTabs() throws {
        XCTAssertEqual(tabBarController.viewControllers?.count, 2)
    }

    func testThatTitleIsNotNil() {
        XCTAssertNotNil(tabBarController.title)
    }

    func testThatTabImagesExists() {
        XCTAssertNotNil(UIImage(named: TabBarType.menu.imageName, in: Bundle.main, compatibleWith: nil))
        XCTAssertNotNil(UIImage(named: TabBarType.news.imageName, in: Bundle.main, compatibleWith: nil))
    }
}

extension MainTabBarControllerTests {
    class MockBarTabable: UIViewController, BarTabable {
        var tabTitle: String
        var tabImageName: String

        required init(tabTitle: String, tabImageName: String) {
            self.tabTitle = tabTitle
            self.tabImageName = tabImageName
            super.init(nibName: nil, bundle: nil)
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
