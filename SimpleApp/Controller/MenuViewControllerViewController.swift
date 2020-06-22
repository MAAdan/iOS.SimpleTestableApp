//
//  Created on 19/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, BarTabable {

    var tabTitle: String
    var tabImageName: String

    required init(tabTitle: String, tabImageName: String) {
        self.tabTitle = tabTitle
        self.tabImageName = tabImageName
        super.init(nibName: nil, bundle: nil)
        setTabBarInfo()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
