//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
@testable import SimpleApp

class ArticleTests: XCTestCase {

    func testArticleNotNil() throws {
        let articleResponse = ArticleResponse.makeArticle()

        XCTAssertNotNil(articleResponse)
    }

    func testDecodedArticle() throws {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "article", ofType: "json") else {
            return XCTFail("article.json not found")
        }

        guard let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            return XCTFail("Unable to convert article.json to String")
        }

        guard let jsonData = jsonString.data(using: .utf8) else {
            return XCTFail("Unable to convert article.json to Data")
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.articleDateFormatter)

        let decodedArticle = try decoder.decode(ArticleResponse.self, from: jsonData)

        let expectedArticle = ArticleResponse.makeArticle()
        XCTAssertEqual(decodedArticle, expectedArticle)
    }
}
