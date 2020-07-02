//
//  Created on 28/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var articleTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(_ article: Article) {
        articleTitle.text = article.title
    }
}
