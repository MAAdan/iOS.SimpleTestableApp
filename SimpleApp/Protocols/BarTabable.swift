//
//  Created on 18/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import UIKit

protocol BarTabable where Self: UIViewController {
    init(tabBarInfo: TabBarInfo)
    func setTabBarInfo(_ tabBarInfo: TabBarInfo)
}

extension BarTabable {
    func setTabBarInfo(_ tabBarInfo: TabBarInfo) {
        self.tabBarItem = UITabBarItem(title: tabBarInfo.title, image: UIImage(named: tabBarInfo.imageName), selectedImage: nil)
    }
}
