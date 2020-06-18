//
//  Created on 15/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
@testable import SimpleApp

class APIClientTests: XCTestCase {
    var mockURLSession: MockURLSession!
    var apiClient: APIClient!

    func testRequestSectionUsesExpectedHost() throws {
        mockURLSession = MockURLSession(data: nil, urlResponse: nil, error: nil)
        apiClient = APIClient(session: mockURLSession)

        apiClient.getSection(.index) { _ in }
        XCTAssertEqual(mockURLSession.urlComponents?.host, "e00-marca.uecdn.es")
    }

    func testRequestSectionUsesExpectedPath() throws {
        mockURLSession = MockURLSession(data: nil, urlResponse: nil, error: nil)
        apiClient = APIClient(session: mockURLSession)

        apiClient.getSection(.index) { _ in }
        XCTAssertEqual(mockURLSession.urlComponents?.path, "/json/index.json")
    }

    func testThatGetSectionCompletionHandlerIsCalled() {
        mockURLSession = MockURLSession(data: nil, urlResponse: nil, error: nil)
        apiClient = APIClient(session: mockURLSession)
        
        let completionExpectation = expectation(description: #function)
        apiClient.getSection(.index) { _ in
            completionExpectation.fulfill()
        }

        waitForExpectations(timeout: 1)
    }

    func testThatGetSectionCompletionHandlerIsCalledWithError() {
        let completionExpectation = expectation(description: #function)

        let error = NSError(domain: "", code: 0, userInfo: nil)
        mockURLSession = MockURLSession(data: nil, urlResponse: nil, error: error)
        apiClient = APIClient(session: mockURLSession)

        apiClient.getSection(.index) { result in
            if case .failure(_) = result {
                completionExpectation.fulfill()
            }
        }

        waitForExpectations(timeout: 1)
    }

    func testThatGetSectionCompletionHandlerIsCalledWithSuccess() {
        guard let jsonData = TestUtils().getData(from: "section", fileType: "json") else {
            return XCTFail("Unable to convert section.json to Data")
        }

        let completionExpectation = expectation(description: #function)

        mockURLSession = MockURLSession(data: jsonData, urlResponse: nil, error: nil)
        apiClient = APIClient(session: mockURLSession)
        apiClient.getSection(.index) { result in
            if case .success(let section) = result {
                XCTAssertEqual(section, Section.makeSection())
                completionExpectation.fulfill()
            }
        }

        waitForExpectations(timeout: 1)
    }

    func testThatGetSectionCompletionHandlerIsCalledWithDecodingError() {
        guard let jsonData = TestUtils().getData(from: "section-with-error", fileType: "json") else {
            return XCTFail("Unable to convert section-with-error.json to Data")
        }

        let completionExpectation = expectation(description: #function)

        mockURLSession = MockURLSession(data: jsonData, urlResponse: nil, error: nil)
        apiClient = APIClient(session: mockURLSession)
        apiClient.getSection(.index) { result in
            if case .failure(let error) = result, case .decode = error {
                completionExpectation.fulfill()
            }
        }

        waitForExpectations(timeout: 1)
    }
}

extension APIClientTests {
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
}
