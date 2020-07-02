//
//  Created on 20/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation
import UIKit

protocol SectionDataSettable: UITableViewDataSource {
    var sectionData: Section? { get set }
}

class SectionDataProvider: NSObject, SectionDataSettable {
    var sectionData: Section?
}

extension SectionDataProvider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionData?.contents.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let article = sectionData?.contents[indexPath.row] else {
            preconditionFailure()
        }

        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NewsTableViewCell.self), for: indexPath) as? NewsTableViewCell else {
            preconditionFailure()
        }

        cell.configure(article)
        return cell
    }
}
