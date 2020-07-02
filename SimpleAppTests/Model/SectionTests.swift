//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
@testable import SimpleApp

class SectionTests: XCTestCase {
    
    func testSectionNotNil() {
        guard let articleResponse = Article.makeArticle() else {
            return XCTFail()
        }

        let sectionBreadcrumb = Section.Breadcrumb(path: "path", types: ["a", "b", "c"], name: "name")

        let sectionResponse = Section(id: "id", title: "title", type: .autocover, sectionId: "sectionId", breadcrumb: sectionBreadcrumb, contents: [articleResponse])

        XCTAssertNotNil(sectionResponse)
    }

    func testDecodedSection() throws {
        guard let jsonData = TestUtils().getData(from: "section", fileType: "json") else {
            return XCTFail("Unable to convert section.json to Data")
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.articleDateFormatter)

        let decodedSection = try decoder.decode(Section.self, from: jsonData)
        let expectedSection = Section.makeSection()

        XCTAssertEqual(decodedSection, expectedSection)
    }
}
