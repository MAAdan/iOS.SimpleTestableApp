//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation

struct section {
    let id: String
    let title: String
    let type: String
    let sectionId: String
    let breadCrumb: SectionBreadcrumb
    let contents: [Article]
}
