//
//  Created on 19/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
import UIKit
@testable import SimpleApp

class SectionViewerViewControllerTests: XCTestCase {

    var tableView: UITableViewMock!
    var sectionDataProvider: SectionDataProvider!
    var sectionViewer: SectionViewerViewController!
    var mockApiClient: APIClientMock!
    var apiClient: APIClient!
    var mockURLSession: MockURLSession!

    override func setUp() {
        tableView = UITableViewMock(frame: .zero)
        sectionDataProvider = SectionDataProvider()
    }

    func testSectionViewerViewControllerTabBarInfoNotNil() {
        makeSectionViewerWithApiClientMock()
        XCTAssertNotNil(sectionViewer.tabBarItem)
    }

    func testThatTableViewIsInViewHeriachy() {
        makeSectionViewerWithApiClientMock()
        let tableViews = sectionViewer.view.subviews.filter {
            $0 == tableView
        }

        XCTAssertEqual(tableViews.count, 1)
        XCTAssertNotNil(tableViews.first)
    }

    func testThatDataSourceIsSectionDataProvider() {
        makeSectionViewerWithApiClientMock()
        XCTAssertTrue(tableView.dataSource is SectionDataProvider)
    }

    func testThatViewDidLoadCallsGetSection() {
        makeSectionViewerWithApiClientMock()
        sectionViewer.loadViewIfNeeded()
        XCTAssertTrue(mockApiClient.getSectionWasCalled)
    }

    func testThatReloadDataIsCalledAfterSuccessfulRequest() {
        guard let tableView = tableView else { return XCTFail() }
        makeSectionViewer()

        let promise = XCTKVOExpectation(keyPath: "reloadDataWasCalled", object: tableView, expectedValue: true)

        sectionViewer.loadViewIfNeeded()

        let result = XCTWaiter().wait(for: [promise], timeout: 1)
        XCTAssertEqual(result, .completed)
    }
}

extension SectionViewerViewControllerTests {
    private func makeSectionViewer() {
        mockURLSession = MockURLSession(data: nil, urlResponse: nil, error: nil)
        apiClient = APIClient(session: mockURLSession)
        sectionViewer = SectionViewerViewController(
            tabTitle: TabBarType.news.title,
            tabImageName: TabBarType.news.imageName,
            tableView: tableView,
            sectionDataProvider: sectionDataProvider,
            apiClient: apiClient
        )
    }

    private func makeSectionViewerWithApiClientMock() {
        mockApiClient = APIClientMock()
        sectionViewer = SectionViewerViewController(
            tabTitle: TabBarType.news.title,
            tabImageName: TabBarType.news.imageName,
            tableView: tableView,
            sectionDataProvider: sectionDataProvider,
            apiClient: mockApiClient
        )
    }
}

extension SectionViewerViewControllerTests {
    class UITableViewMock: UITableView {
        //Add  @objc dynamic in order to make UITableViewMock KVC-compliant
        @objc dynamic var reloadDataWasCalled = false
        override func reloadData() {
            reloadDataWasCalled = true
        }
    }
}
