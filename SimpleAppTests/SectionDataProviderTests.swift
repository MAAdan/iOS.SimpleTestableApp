//
//  Created on 20/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
@testable import SimpleApp

class SectionDataProviderTests: XCTestCase {
    var sectionDataProvider: SectionDataProvider!
    var tableView: UITableView!

    override func setUp() {
        tableView = UITableView(frame: .zero)
        sectionDataProvider = SectionDataProvider()
        tableView.dataSource = sectionDataProvider
    }

    func testNumberOfSectionsIsOne() {
        XCTAssertEqual(tableView.numberOfSections, 1)
    }

    func testNumberOrRowsInSection() {
        sectionDataProvider.sectionData = Section.makeSection()
        let totalRows = tableView.numberOfRows(inSection: 0)
        XCTAssertEqual(totalRows, 1)
    }

    func testThatTableViewCellIsCorrectType() {
        makeTableWithRows()
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is NewsTableViewCell)
    }

    func testThatCellShowsCorrectTitle() {
        makeTableWithRows()
        guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? NewsTableViewCell else {
            return XCTFail()
        }

        XCTAssertEqual(cell.articleTitle.text, "title")
    }

    func testThatTitleLabelHasZeroLines() {
        makeTableWithRows()
        guard let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? NewsTableViewCell else {
            return XCTFail()
        }

        XCTAssertEqual(cell.articleTitle.numberOfLines, 0)
    }
}

extension SectionDataProviderTests {
    func makeTableWithRows() {
        sectionDataProvider.sectionData = Section.makeSection()
        let newsCellFileName = String(describing: NewsTableViewCell.self)
        tableView.register(UINib(nibName: newsCellFileName, bundle: nil), forCellReuseIdentifier: newsCellFileName)
        tableView.reloadData()
    }
}
