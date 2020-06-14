//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
@testable import SimpleApp

class ArticleTests: XCTestCase {

    func testArticleNotNil() throws {
        guard let url = URL(string: "https://www.general.com") else {
            return XCTFail()
        }

        let multimediaArticle = [
            MultimediaArticle(
                id: "id",
                width: 0,
                height: 0,
                sourceUrl: url,
                multimediaArticleUrl: url,
                icon: "icon",
                title: "title",
                author: "author",
                type: .image,
                position: .subtitle
            )
        ]

        let newsItem = Article(
            id: "id",
            type: "type",
            title: "itle",
            webContent: false,
            sponsored: false,
            subsection: "section",
            subsectionUrl: url,
            subtitle: "subtitle",
            idSection: "idSection",
            viewClass: "viewClass",
            section: "",
            date: Date(),
            video: false,
            multimedia: multimediaArticle
        )

        XCTAssertNotNil(newsItem)
    }
}
