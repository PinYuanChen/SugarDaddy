//
// Created on 2022/12/13.
//

import Foundation

extension Optional {
    var isNil: Bool {
        self == nil
    }
    
    /// SugarDaddy: Unwrap and check predicate
    ///
    /// var str: String? = "text"
    /// str.matching { $0.count < 2} -> nil
    ///
    func matching(_ predicate: (Wrapped) -> Bool) -> Wrapped? {
        guard let value = self,
              predicate(value)else {
            return nil
        }
        
        return value
    }
}

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

/// SugarDaddy: Check if Int is nil or empty
///
/// var num: Int? = 0
/// str.isNilOrZero -> true
///
extension Optional where Wrapped == Int {
    var isNilOrZero: Bool {
        self == nil || self == 0
    }
}

/// SugarDaddy: Check if collection is nil or empty
extension Optional where Wrapped: Collection {
    var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
}
