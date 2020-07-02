//
//  Created on 19/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import UIKit

class SectionViewerViewController: UIViewController, BarTabable {

    var tabTitle: String
    var tabImageName: String
    private let tableView: UITableView
    private let sectionDataProvider: SectionDataSettable
    private let apiClient: APIClientProtocol
    private let newsCellFileName = String(describing: NewsTableViewCell.self)

    required init(tabTitle: String, tabImageName: String, tableView: UITableView, sectionDataProvider: SectionDataSettable, apiClient: APIClientProtocol) {
        self.tableView = tableView
        self.tabTitle = tabTitle
        self.tabImageName = tabImageName
        self.sectionDataProvider = sectionDataProvider
        self.apiClient = apiClient
        super.init(nibName: nil, bundle: nil)
        self.tableView.dataSource = sectionDataProvider
        setTabBarInfo()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: newsCellFileName, bundle: nil), forCellReuseIdentifier: newsCellFileName)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        getSection()
    }

    private func getSection() {
        apiClient.getSection(.index) { result in
            switch result {
            case .success(let section):
                self.sectionDataProvider.sectionData = section
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(_):
                DispatchQueue.main.async {
                    let alert = RetryController.makeAlert(title: "error", message: "error", completionHandler: self.getSection)
                    self.present(alert, animated: true)
                }
            }
        }
    }
}
