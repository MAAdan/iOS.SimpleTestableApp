//
//  Created on 15/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation

protocol SessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: SessionProtocol { }

enum APIClientError: Error {
    case nilData
    case decode
    case genericNetwork(Error)
}

protocol APIClientProtocol {
    func getSection(_ section: URL.sectionPath, completion: @escaping (Result<Section, APIClientError>) -> Void)
}

class APIClient: APIClientProtocol {

    private let session: SessionProtocol

    init(session: SessionProtocol) {
        self.session = session
    }

    func getSection(_ section: URL.sectionPath, completion: @escaping (Result<Section, APIClientError>) -> Void) {

        guard let url = URL(string: URL.sectionDomain + section.rawValue) else {
            preconditionFailure()
        }

        let dataTask = session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return completion(.failure(.nilData))
            }

            guard let error = error else {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(DateFormatter.articleDateFormatter)

                do {
                    return completion(.success(try decoder.decode(Section.self, from: data)))
                } catch {
                    return completion(.failure(.decode))
                }
            }

            completion(.failure(.genericNetwork(error)))
        }

        dataTask.resume()
    }
}
