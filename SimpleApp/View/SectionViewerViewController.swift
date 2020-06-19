//
//  Created on 19/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import UIKit

class SectionViewerViewController: UIViewController, BarTabable {

    required init(tabTitle: String, tabImageName: String) {
        super.init(nibName: nil, bundle: nil)
        setTabBarInfo(tabTitle: tabTitle, tabImageName: tabImageName)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
