//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation

struct SectionResponse: Decodable, Equatable {
    let id: String
    let title: String
    let type: SectionType
    let sectionId: String
    let breadcrumb: SectionBreadcrumb
    let contents: [ArticleResponse]

    private enum CodingKeys: String, CodingKey {
        case id
        case title = "titulo"
        case type
        case sectionId = "sectionId"
        case breadcrumb
        case contents = "cts"
    }
}
