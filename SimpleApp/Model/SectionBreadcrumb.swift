//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation

struct SectionBreadcrumb: Decodable, Equatable {
    let path: String
    let types: [String]
    let name: String
}
