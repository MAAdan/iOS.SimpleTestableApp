//
//  Created on 19/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
import UIKit
@testable import SimpleApp

class SectionViewerViewControllerTests: XCTestCase {

    var tableView: UITableView!
    var sectionDataProvider: SectionDataProvider!
    var sectionViewer: SectionViewerViewController!
    var apiClient: APIClientMock!

    override func setUp() {
        tableView = UITableView(frame: .zero)
        sectionDataProvider = SectionDataProvider()
        apiClient = APIClientMock()
        sectionViewer = SectionViewerViewController(tabTitle: TabBarType.news.title, tabImageName: TabBarType.news.imageName, tableView: tableView, sectionDataProvider: sectionDataProvider, apiClient: apiClient)
    }

    func testSectionViewerViewControllerTabBarInfoNotNil() {
        XCTAssertNotNil(sectionViewer.tabBarItem)
    }

    func testThatTableViewIsInViewHeriachy() {
        sectionViewer.loadViewIfNeeded()
        let tableViews = sectionViewer.view.subviews.filter {
            $0 == tableView
        }

        XCTAssertEqual(tableViews.count, 1)
        XCTAssertNotNil(tableViews.first)
    }

    func testThatDataSourceIsSectionDataProvider() {
        sectionViewer.loadViewIfNeeded()
        XCTAssertTrue(tableView.dataSource is SectionDataProvider)
    }

    func testThatViewDidLoadCallsGetSection() {
        sectionViewer.loadViewIfNeeded()
        XCTAssertTrue(apiClient.getSectionWasCalled)
    }
}
