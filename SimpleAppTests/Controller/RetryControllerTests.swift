//
//  Created on 30/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
@testable import SimpleApp

class RetryControllerTests: XCTestCase {

    func testThatRetryControllerIsNotNil() {
        XCTAssertNotNil(RetryController.makeAlert(title: "", message: "", completionHandler: {}))
    }

    func testThatRetryControllerHasOneAction() {
        let retryController = RetryController.makeAlert(title: "", message: "", completionHandler: {})
        XCTAssertEqual(retryController.actions.count, 1)
    }

    func testThatCompletionHandlerIsCalledOnRetryAction() throws {
        let expectation = self.expectation(description: #function)
        let retryController = RetryController.makeAlert(title: "", message: "", completionHandler: {
            expectation.fulfill()
        })

        let keyWindow = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        keyWindow?.rootViewController?.present(retryController, animated: true, completion: nil)

        retryController.executeHandlerForButton(atIndex: 0)
        wait(for: [expectation], timeout: 1)
    }
}

//From https://stackoverflow.com/a/54111746
extension UIAlertController {
    typealias AlertHandler = @convention(block) (UIAlertAction) -> Void

    func executeHandlerForButton(atIndex index: Int) {
        guard let block = actions[index].value(forKey: "handler") else { return }
        let handler = unsafeBitCast(block as AnyObject, to: AlertHandler.self)
        handler(actions[index])
    }
}
