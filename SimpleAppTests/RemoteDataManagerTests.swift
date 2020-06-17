//
//  Created on 15/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
@testable import SimpleApp

class APIClientTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testRemoteDataRequest() throws {
        let mockURLSession = MockURLSession()
        let apiClient = APIClient(session: mockURLSession)
        apiClient.getSection { section, error in
            
        }
    }
}

extension APIClientTests {
    class MockURLSession: SessionProtocol {
        var url: URL?

        func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            self.url = url
            return URLSession.shared.dataTask(with: url)
        }
    }
}
