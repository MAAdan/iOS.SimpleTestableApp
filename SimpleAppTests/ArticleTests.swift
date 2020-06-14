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

        let multimedia = [ArticleMultimedia(id: "id", width: 0, height: 0, sourceUrl: url, multimediaArticleUrl: url, icon: "icon", title: "title", author: "author", type: .image, position: .subtitle)]

        let authors = [ArticleAuthor(name: "name", location: "location")]
        
        let tags = [ArticleTag(id: "id", nameTag: "name", relevance: "relevance", autocoverUrl: url)]

        let articleResponse = ArticleResponse(id: "id", type: .live, title: "itle", webContent: false, sponsored: false, subsection: "section", subsectionUrl: url, subtitle: "subtitle", idSection: "idSection", viewClass: "viewClass", section: "section", date: Date(), video: false, multimedia: multimedia, authors: authors, tags: tags)

        XCTAssertNotNil(articleResponse)
    }
}
