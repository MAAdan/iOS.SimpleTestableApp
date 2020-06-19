//
//  Created on 18/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import UIKit

protocol BarTabable where Self: UIViewController {
    init(tabTitle: String, tabImageName: String)
}

extension BarTabable {
    func setTabBarInfo(tabTitle: String, tabImageName: String) {
        self.tabBarItem = UITabBarItem(title: tabTitle, image: UIImage(named: tabImageName), selectedImage: nil)
    }
}
