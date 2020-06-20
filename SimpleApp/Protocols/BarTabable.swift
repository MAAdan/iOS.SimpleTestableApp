//
//  Created on 18/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import UIKit

protocol BarTabable where Self: UIViewController {
    var tabTitle: String { get }
    var tabImageName: String { get }
}

extension BarTabable {
    func setTabBarInfo() {
        self.tabBarItem = UITabBarItem(title: tabTitle, image: UIImage(named: tabImageName), selectedImage: nil)
    }
}
