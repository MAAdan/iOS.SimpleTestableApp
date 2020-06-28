//
//  Created on 20/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
@testable import SimpleApp

class SectionDataProviderTests: XCTestCase {
    var sectionDataProvider: SectionDataProvider!
    var sectionViewer: SectionViewerViewController!
    var tableView: UITableView!

    override func setUp() {
        tableView = UITableView(frame: .zero)
        sectionDataProvider = SectionDataProvider()
        let apiClientMock = MockAPIClient()
        sectionViewer = SectionViewerViewController(tabTitle: TabBarType.news.title, tabImageName: TabBarType.news.imageName, tableView: tableView, sectionDataProvider: sectionDataProvider, apiClient: apiClientMock)
    }

    func testNumberOfSectionsIsOne() {
        XCTAssertEqual(tableView.numberOfSections, 1)
    }

    func testNumberOrRowsInSection() {
        sectionDataProvider.sectionData = Section.makeSection()
        let totalRows = tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(totalRows, 1)
    }
}
