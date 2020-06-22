//
//  Created on 22/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation
@testable import SimpleApp

class APIClientMock: APIClientProtocol {
    var getSectionWasCalled = false
    func getSection(_ section: URL.sectionPath, completion: @escaping (Result<Section, APIClientError>) -> Void) {
        getSectionWasCalled = true
    }
}
