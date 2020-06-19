//
//  Created on 18/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
@testable import SimpleApp

class TabBarItemInfoTests: XCTestCase {

    func testTabBarInfoNotNil() {
        XCTAssertNotNil(TabBarInfo(title: "title", imageName: "imageName"))
    }
}
