//
// Created on 2022/12/7.
//

import Foundation

/// SugarDaddy:Prepare class instance
///
/// let view = UIView() --> {
///     add your setup here
/// }
infix operator -->

func --> <T>(object: T, closure: (T) -> Void) -> T {
    closure(object)
    return object
}

/// SugarDaddy: Setup properties via method chaining ( only available after Swift 5.1)
/// Either use 'Make' to wrap up property or use postfix operator
@dynamicMemberLookup
struct Make<T> {
    let object: T
    
    @inlinable public init(_ obj: T) {
        self.object = obj
    }
    
    subscript<Value>(dynamicMember keyPath: WritableKeyPath<T, Value>) -> ((Value) -> Make<T>) {
        var obj = self.object
        return { value in
            obj[keyPath: keyPath] = value
            return Make(obj)
        }
    }
}

postfix operator >>

postfix func >> <T>(lhs: T) -> Make<T> {
    return Make(lhs)
}
