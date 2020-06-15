//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation

struct ArticleTag: Decodable, Equatable {
    let id: String
    let name: String
    let relevance: String
    let autocoverUrl: URL

    private enum CodingKeys: String, CodingKey {
        case id = "idTag"
        case name = "nameTag"
        case relevance
        case autocoverUrl
    }
}
