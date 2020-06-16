//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation

struct Section: Decodable, Equatable {
    let id: String
    let title: String
    let type: SectionType
    let sectionId: String
    let breadcrumb: Breadcrumb
    let contents: [Article]
}

extension Section {
    private enum CodingKeys: String, CodingKey {
        case id
        case title = "titulo"
        case type
        case sectionId = "sectionId"
        case breadcrumb
        case contents = "cts"
    }

    enum SectionType: String, Decodable, Equatable {
        case autocover
    }

    struct Breadcrumb: Decodable, Equatable {
        let path: String
        let types: [String]
        let name: String
    }
}
