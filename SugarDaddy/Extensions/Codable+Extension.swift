//
// Created on 2022/12/14.
//

import Foundation

/// SugarDaddy: Encode via JSONEncoder
extension Encodable {
    func encoded() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}
