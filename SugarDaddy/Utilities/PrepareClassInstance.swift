//
// Created on 2022/12/7.
//

import Foundation

infix operator -->

/// Prepare class instance
func --> <T>(object: T, closure: (T) -> Void) -> T {
    closure(object)
    return object
}
