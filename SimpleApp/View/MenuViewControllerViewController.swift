//
//  Created on 19/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, BarTabable {

    required init(tabBarInfo: TabBarInfo) {
        super.init(nibName: nil, bundle: nil)
        setTabBarInfo(tabBarInfo)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
