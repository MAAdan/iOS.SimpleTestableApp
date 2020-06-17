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

    enum APIClientError: Error {
        case decode
        case genericNetwork(Error)
    }

    let session: SessionProtocol

    init(session: SessionProtocol) {
        self.session = session
    }

    func getSection(_ section: URL.sectionPath, completion: @escaping (Result<Section?, APIClientError>) -> Void) {

        guard let url = URL(string: URL.sectionDomain + section.rawValue) else {
            preconditionFailure()
        }

        let dataTask = session.dataTask(with: url) { data, response, error in
            guard let error = error else {
                return completion(.success(nil))
            }

            completion(.failure(.genericNetwork(error)))
        }

        dataTask.resume()
    }
}
