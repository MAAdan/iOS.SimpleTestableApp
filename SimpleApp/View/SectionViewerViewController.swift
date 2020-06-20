//
//  Created on 19/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import UIKit

class SectionViewerViewController: UIViewController, BarTabable {

    var tabTitle: String
    var tabImageName: String
    private let tableView: UITableView

    required init(tabTitle: String, tabImageName: String, tableView: UITableView) {
        self.tableView = tableView
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

        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
