//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation
@testable import SimpleApp

extension ArticleResponse {
    static func makeArticle() -> ArticleResponse? {
        guard let url = URL(string: "https://www.url.com") else {
            return nil
        }

        let multimedia = [ArticleMultimedia(id: "id", width: 0, height: 0, sourceUrl: url, url: url, icon: "icon", title: "title", author: "author", articleType: .image, articlePosition: .subtitle)]

        let authors = [ArticleAuthor(name: "name", location: "location")]

        let tags = [ArticleTag(id: "id", name: "name", relevance: "relevance", autocoverUrl: url)]

        let dateFormatter = DateFormatter.articleDateFormatter
        guard let articleDate = dateFormatter.date(from: "Sun, 14 Jun 2020 18:15:21 +0200") else {
            return nil
        }

        return ArticleResponse(id: "id", type: .live, url: url, title: "title", sponsored: "sponsored", subsection: "subsection", urlSubsection: url, subtitle: "subtitle", idSection: "sectionId", viewClass: "viewClass", section: "section", date: articleDate, video: false, multimedia: multimedia, authors: authors, tags: tags)
    }
}
