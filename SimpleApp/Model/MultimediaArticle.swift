//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation

struct MultimediaArticle {
    let id: String
    let width: Int?
    let height: Int?
    let sourceUrl: URL?
    let multimediaArticleUrl: URL
    let icon: String?
    let title: String
    let author: String
    let type: MultimediaArticleType
    let position: MultimediaArticlePosition?

    enum MultimediaArticleType {
        case image
        case video
    }

    enum MultimediaArticlePosition {
        case subtitle
    }
}
