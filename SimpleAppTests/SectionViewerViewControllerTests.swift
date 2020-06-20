//
//  Created on 19/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
import UIKit
@testable import SimpleApp

class SectionViewerViewControllerTests: XCTestCase {

    var sectionViewer: SectionViewerViewController!

    override func setUp() {
        sectionViewer = SectionViewerViewController(tabTitle: TabBarType.news.title, tabImageName: TabBarType.news.imageName, tableView: UITableView())
    }

    func testSectionViewerViewControllerTabBarInfoNotNil() {
        XCTAssertNotNil(sectionViewer.tabBarItem)
    }

    func testThatTableViewIsInViewHeriachy() {
        sectionViewer.loadViewIfNeeded()
        var tableViews = [UIView]()
        sectionViewer.view.subviews.forEach {
            if $0 is UITableView {
                tableViews.append($0)
            }
        }

        XCTAssertEqual(tableViews.count, 1)
        XCTAssertNotNil(tableViews.first)
    }
}
