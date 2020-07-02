//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation

struct Article: Decodable, Equatable {
    let id: String
    let type: ArticleType
    let url: URL
    let title: String
    let sponsored: String
    let subsection: String
    let idSection: String
    let viewClass: String
    let section: String
    let date: Date
    let video: Bool
    let multimedia: [Multimedia]
    let authors: [Author]?
    let tags: [Tag]?
}

extension Article {
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case url
        case title = "titulo"
        case sponsored = "patrocinio"
        case subsection = "cintillo"
        case idSection = "sectionId"
        case viewClass
        case section = "seccion"
        case date = "publishedAt"
        case video = "hasVideo"
        case multimedia
        case authors
        case tags
    }

    enum ArticleType: String, Decodable, Equatable {
        case article = "noticia"
        case chronicle = "cronica"
        case live = "directo"
        case liveChronicle = "cronicadirecto"
    }

    struct Tag: Decodable, Equatable {
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

    struct Author: Decodable, Equatable {
        let name: String
        let location: String
    }

    struct Multimedia: Decodable, Equatable {
        let id: String
        let width: Int?
        let height: Int?
        let sourceUrl: URL?
        let url: URL
        let icon: String?
        let title: String
        let author: String
        let articleType: Multimedia.MultimediaType
        let articlePosition: Multimedia.MultimediaPosition?

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
            case subtitle = "Antetitulo"
        }
    }
}
