//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation

struct ArticleMultimedia: Decodable, Equatable {
    let id: String
    let width: Int?
    let height: Int?
    let sourceUrl: URL?
    let url: URL
    let icon: String?
    let title: String
    let author: String
    let articleType: ArticleMultimedia.MultimediaType
    let articlePosition: ArticleMultimedia.MultimediaPosition?

    private enum CodingKeys: String, CodingKey {
        case id
        case width
        case height
        case sourceUrl
        case url
        case icon = "hasIcon"
        case title = "titulo"
        case author = "autor"
        case articleType = "type"
        case articlePosition = "position"
    }

    enum MultimediaType: String, Decodable, Equatable {
        case image
        case video
    }

    enum MultimediaPosition: String, Decodable, Equatable {
        case subtitle
    }
}
