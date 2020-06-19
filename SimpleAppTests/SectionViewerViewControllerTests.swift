//
//  Created on 19/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import XCTest
@testable import SimpleApp

class SectionViewerViewControllerTests: XCTestCase {

    func testSectionViewerViewControllerTabBarInfoNotNil() throws {
        let sectionViewer = SectionViewerViewController(tabTitle: TabBarType.news.title, tabImageName: TabBarType.news.imageName)
        XCTAssertNotNil(sectionViewer.tabBarItem)
    }
}
