//
//  Created on 20/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation
import UIKit

protocol SectionDataSettable {
    var sectionData: Section? { get set }
}

class SectionDataProvider: NSObject, SectionDataSettable {
    var sectionData: Section?
}

extension SectionDataProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionData = sectionData else {
            return 0
        }
        
        return sectionData.contents.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
