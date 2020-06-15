//
//  Created on 14/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation

extension DateFormatter {
  static let articleDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()
}
