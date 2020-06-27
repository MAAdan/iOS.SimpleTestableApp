//
//  Created on 26/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation
@testable import SimpleApp

class MockURLSession: SessionProtocol {

    private let dataTask: MockTask

    var url: URL?
    var completionHandlerWasCalled = false

    var urlComponents: URLComponents? {
        guard let url = url else { return nil }
        return URLComponents(url: url, resolvingAgainstBaseURL: true)
    }

    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        dataTask = MockTask(data: data, urlResponse: urlResponse, error: error)
    }

    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.url = url
        dataTask.completionHandler = completionHandler
        return dataTask
    }
}

class MockTask: URLSessionDataTask {
    private let data: Data?
    private let urlResponse: URLResponse?
    private let responseError: Error?

    typealias CompletionHandler = (Data?, URLResponse?, Error? ) -> Void
    var completionHandler: CompletionHandler?

    init(data: Data?, urlResponse: URLResponse?, error: Error?) {
        self.data = data
        self.urlResponse = urlResponse
        self.responseError = error
    }

    override func resume() {
        DispatchQueue.main.async {
            self.completionHandler?(self.data, self.urlResponse, self.responseError)
        }
    }
}
