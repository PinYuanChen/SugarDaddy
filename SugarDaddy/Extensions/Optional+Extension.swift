//
// Created on 2022/12/13.
//

import Foundation

/// SugarDaddy: Check if string is nil or empty
///
/// var str: String? = ""
/// str.isNilOrEmpty -> true
/// 
extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        self == nil || self == ""
    }
}
