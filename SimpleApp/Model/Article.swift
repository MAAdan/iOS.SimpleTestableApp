//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation

struct Article {
    let id: String
    let type: String
    let title: String
    let webContent: Bool
    let sponsored: Bool
    let subsection: String
    let subsectionUrl: URL
    let subtitle: String
    let idSection: String
    let viewClass: String
    let section: String
    let date: Date
    let video: Bool
    let multimedia: [MultimediaArticle]
}
