//
//  Created on 18/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
@testable import SimpleApp

class MainNavigationControllerTests: XCTestCase {

    func testThatRootViewControllerIsMainTabBarViewController() throws {
        let mainContainer = MainContainerViewController(nibName: nil, bundle: nil)
        mainContainer.loadViewIfNeeded()
        guard let navigationController = mainContainer.children.first as? MainNavigationController else {
            return XCTFail()
        }

        XCTAssertTrue(navigationController.viewControllers.first is MainTabBarController)
    }
}
