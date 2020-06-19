//
//  Created on 18/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
@testable import SimpleApp

class MainContainerViewControllerTests: XCTestCase {

    var mainContainer: MainContainerViewController!

    override func setUpWithError() throws {
        mainContainer = MainContainerViewController(nibName: nil, bundle: nil)
    }

    func testThatMainContainerViewControllerHasOneChildViewController() throws {
        mainContainer.loadViewIfNeeded()
        XCTAssertEqual(mainContainer.children.count, 1)
    }

    func testThatChildViewControllerIsMainNavigationViewController() {
        mainContainer.loadViewIfNeeded()
        XCTAssertTrue(mainContainer.children.first is MainNavigationController)
    }

    func testThatViewControllerHasOneSubview() {
        mainContainer.loadViewIfNeeded()
        mainContainer.beginAppearanceTransition(true, animated: true)
        mainContainer.endAppearanceTransition()

        XCTAssertEqual(mainContainer.view.subviews.count, 1)
    }
}
