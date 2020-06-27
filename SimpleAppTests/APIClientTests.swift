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
        XCTAssertEqual(mockURLSession.urlComponents?.path, URL.sectionPath.index.rawValue)
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
