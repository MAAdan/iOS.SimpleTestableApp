//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation
@testable import SimpleApp

extension Section {
    static func makeSection() -> Section? {
        guard let articleResponse = Article.makeArticle() else {
            return nil
        }

        let sectionBreadcrumb = Breadcrumb(path: "path", types: ["a", "b", "c"], name: "name")

        return Section(id: "id", title: "title", type: .autocover, sectionId: "sectionId", breadcrumb: sectionBreadcrumb, contents: [articleResponse])
    }
}
