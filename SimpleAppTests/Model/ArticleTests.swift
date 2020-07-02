//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
@testable import SimpleApp

class ArticleTests: XCTestCase {

    func testArticleNotNil() throws {
        let articleResponse = Article.makeArticle()

        XCTAssertNotNil(articleResponse)
    }

    func testDecodedArticle() throws {
        guard let jsonData = TestUtils().getData(from: "article", fileType: "json") else {
            return XCTFail("Unable to convert article.json to Data")
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.articleDateFormatter)

        let decodedArticle = try decoder.decode(Article.self, from: jsonData)
        let expectedArticle = Article.makeArticle()
        
        XCTAssertEqual(decodedArticle, expectedArticle)
    }
}
