//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
@testable import SimpleApp

class SectionTests: XCTestCase {
    
    func testSectionNotNil() {
        guard let url = URL(string: "https://www.general.com") else {
            return XCTFail()
        }

        let sectionBreadcrumb = SectionBreadcrumb(
            path: "path",
            types: ["a", "b", "c"],
            name: "name"
        )

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

        let newsSectionContents = [
            Article(
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
        ]

        let section = Section(
            id: "id",
            title: "title",
            type: "type",
            sectionId: "sectionId",
            breadCrumb: sectionBreadcrumb,
            contents: newsSectionContents
        )

        XCTAssertNotNil(section)
    }
}
