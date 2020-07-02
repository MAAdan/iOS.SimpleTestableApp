//
//  Created on 30/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import UIKit

class RetryController {
    static func makeAlert(title: String, message: String, completionHandler: @escaping () -> ()) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default) { action in
            completionHandler()
        }

        alertController.addAction(action)
        return alertController
    }
}
