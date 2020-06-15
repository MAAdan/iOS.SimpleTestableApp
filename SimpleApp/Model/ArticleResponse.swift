//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation

struct ArticleResponse: Decodable, Equatable {
    let id: String
    let type: ArticleType
    let url: URL
    let title: String
    let sponsored: String
    let subsection: String
    let urlSubsection: URL
    let subtitle: String
    let idSection: String
    let viewClass: String
    let section: String
    let date: Date
    let video: Bool
    let multimedia: [ArticleMultimedia]
    let authors: [ArticleAuthor]
    let tags: [ArticleTag]

    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case url
        case title = "titulo"
        case sponsored = "patrocinio"
        case subsection = "cintillo"
        case urlSubsection = "cintilloUrl"
        case subtitle
        case idSection = "sectionId"
        case viewClass
        case section = "seccion"
        case date = "publishedAt"
        case video = "hasVideo"
        case multimedia
        case authors
        case tags
    }
}
