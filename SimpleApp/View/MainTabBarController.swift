//
//  Created on 18/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    init(viewControllers: [BarTabable]) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = viewControllers
        self.title = "Home"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
