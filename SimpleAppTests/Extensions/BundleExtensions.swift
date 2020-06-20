//
//  Created on 15/06/2020.
//  Copyright © 2020 Miguel Adan. All rights reserved.
//

import Foundation

class TestUtils {
    func getData(from fileName: String, fileType: String) -> Data? {
        guard let pathString = Bundle(for: type(of: self)).path(forResource: fileName, ofType: fileType) else {
            return nil
        }

        guard let jsonString = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            return nil
        }

        guard let jsonData = jsonString.data(using: .utf8) else {
            return nil
        }

        return jsonData
    }
}
