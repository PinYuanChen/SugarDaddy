//
// Created on 2022/12/14.
//

import Foundation

/// SugarDaddy: Decode by JSONDecoder
extension Data {
    func decoded<T: Decodable>() throws -> T {
        return try JSONDecoder().decode(T.self, from: self)
    }
}
