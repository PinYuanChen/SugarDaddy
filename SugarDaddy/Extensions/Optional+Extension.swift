//
// Created on 2022/12/13.
//

import Foundation

extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        self == nil || self == ""
    }
}
