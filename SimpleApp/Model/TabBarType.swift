//
//  Created on 19/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation

enum TabBarType {
    case menu
    case news

    var title: String {
        switch self {
        case .menu:
            return "Menu"
        case .news:
            return "News"
        }
    }

    var imageName: String {
        switch self {
        case .menu:
            return "menu"
        case .news:
            return "news"
        }
    }
}
