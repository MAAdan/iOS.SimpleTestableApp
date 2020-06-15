//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
@testable import SimpleApp

class SectionTests: XCTestCase {
    
    func testSectionNotNil() {
        guard let articleResponse = ArticleResponse.makeArticle() else {
            return XCTFail()
        }

        let sectionBreadcrumb = SectionBreadcrumb(path: "path", types: ["a", "b", "c"], name: "name")

        let sectionResponse = SectionResponse(id: "id", title: "title", type: .autocover, sectionId: "sectionId", breadcrumb: sectionBreadcrumb, contents: [articleResponse])

        XCTAssertNotNil(sectionResponse)
    }

    func testDecodedSection() throws {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "section", ofType: "json") else {
            return XCTFail("section.json not found")
        }

        guard let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            return XCTFail("Unable to convert section.json to String")
        }

        guard let jsonData = jsonString.data(using: .utf8) else {
            return XCTFail("Unable to convert section.json to Data")
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.articleDateFormatter)

        let decodedSection = try decoder.decode(SectionResponse.self, from: jsonData)
        let expectedSection = SectionResponse.makeSection()

        XCTAssertEqual(decodedSection, expectedSection)
    }
}
