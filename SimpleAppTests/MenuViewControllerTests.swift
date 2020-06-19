//
//  Created on 19/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
@testable import SimpleApp

class MenuViewControllerTests: XCTestCase {

    func testMenuViewControllerTabBarInfoNotNil() throws {
        let menuViewController = MenuViewController(tabBarInfo: TabBarInfo(title: "Title", imageName: "ImageName"))
        XCTAssertNotNil(menuViewController.tabBarItem)
    }
}
