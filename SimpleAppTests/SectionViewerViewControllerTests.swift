//
//  Created on 19/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
import UIKit
@testable import SimpleApp

class SectionViewerViewControllerTests: XCTestCase {

    var sectionViewer: SectionViewerViewController!
    var tableView: MockUITableView!
    var sectionDataProvider: MockSectionDataProvider!
    var mockApiClient: MockAPIClient!
    var apiClient: APIClient!
    var mockURLSession: MockURLSession!

    override func setUp() {
        tableView = MockUITableView(frame: .zero)
        sectionDataProvider = MockSectionDataProvider()
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
        XCTAssertTrue(tableView.dataSource is SectionDataSettable)
    }

    func testThatViewDidLoadCallsGetSection() {
        makeSectionViewerWithApiClientMock()
        sectionViewer.loadViewIfNeeded()
        XCTAssertTrue(mockApiClient.getSectionWasCalled)
    }

    func testThatReloadDataIsCalledAfterSuccessfulRequest() {
        makeSectionViewer(makeSectionData())
        sectionViewer.loadViewIfNeeded()

        let expectation = self.expectation(description: #function)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            XCTAssertTrue(self.tableView.reloadDataWasCalled)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.05)
    }

    func testThatSectionDataIsNotNilAfterSuccessfulRequest() {
        makeSectionViewer(makeSectionData())
        sectionViewer.loadViewIfNeeded()

        let expectation = self.expectation(description: #function)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            XCTAssertNotNil(self.sectionDataProvider.sectionData)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.05)
    }

    func testThatRegisterCellIsCalled() {
        makeSectionViewerWithApiClientMock()
        sectionViewer.loadViewIfNeeded()
        XCTAssertTrue(tableView.registerNibWasCalled)
    }

    func testThatRetryAlertIsShownOnRequestFailure() {
        makeSectionViewer(TestUtils().getData(from: "section-with-error", fileType: "json"))
        let keyWindow = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        keyWindow?.rootViewController = sectionViewer

        let expectation = self.expectation(description: #function)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            XCTAssertNotNil(self.sectionViewer.presentedViewController)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 0.05)
    }
}

extension SectionViewerViewControllerTests {
    func makeSectionData() -> Data? {
        return TestUtils().getData(from: "section", fileType: "json")
    }

    private func makeSectionViewer(_ data: Data?) {
        mockURLSession = MockURLSession(data: data, urlResponse: nil, error: nil)
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
        mockApiClient = MockAPIClient()
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
    class MockSectionDataProvider: NSObject, SectionDataSettable {
        var sectionData: Section?

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 0
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }

    class MockUITableView: UITableView {
        //Add  @objc dynamic in order to make UITableViewMock KVC-compliant
        @objc dynamic var reloadDataWasCalled = false
        var registerNibWasCalled = false

        override func reloadData() {
            reloadDataWasCalled = true
        }

        override func register(_ nib: UINib?, forCellReuseIdentifier identifier: String) {
            registerNibWasCalled = true
        }
    }
}
