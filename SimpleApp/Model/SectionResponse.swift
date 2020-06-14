//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation

struct SectionResponse {
    let id: String
    let title: String
    let type: SectionType
    let sectionId: String
    let breadCrumb: SectionBreadcrumb
    let contents: [ArticleResponse]
}
