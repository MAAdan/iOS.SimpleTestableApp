//
//  Created on 15/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation

protocol SessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: SessionProtocol { }

class APIClient {

    let session: SessionProtocol

    init(session: SessionProtocol) {
        self.session = session
    }

    func getSection(completion: @escaping (Section?, Error?) -> Void) {

    }
}
