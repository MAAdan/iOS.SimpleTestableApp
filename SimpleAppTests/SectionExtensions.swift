//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation
@testable import SimpleApp

extension SectionResponse {
    static func makeSection() -> SectionResponse? {
        guard let articleResponse = ArticleResponse.makeArticle() else {
            return nil
        }

        let sectionBreadcrumb = SectionBreadcrumb(path: "path", types: ["a", "b", "c"], name: "name")

        return SectionResponse(id: "id", title: "title", type: .autocover, sectionId: "sectionId", breadcrumb: sectionBreadcrumb, contents: [articleResponse])
    }
}
