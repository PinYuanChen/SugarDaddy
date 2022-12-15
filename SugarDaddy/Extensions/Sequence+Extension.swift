//
// Created on 2022/12/15.
//

import Foundation

extension Sequence {
    /// SugarDaddy: Sorted sequence using keypath
    ///
    /// let ary = [1,5,3,6,2,4]
    /// ary.sortedAscending(\.self) -> [1, 2, 3, 4, 5, 6]
    /// 
    func sortedAscending<T: Comparable>(_ path: KeyPath<Element, T>) -> [Element] {
        sorted {
            $0[keyPath: path] < $1[keyPath: path]
        }
    }
    
    func sortedDescending<T: Comparable>(_ path: KeyPath<Element, T>) -> [Element] {
        sorted {
            $0[keyPath: path] > $1[keyPath: path]
        }
    }
    
    /// SugarDaddy: Reduce sequence elements using keypath
    ///
    /// let ary = [1,5,3,6,2,4]
    /// ary.reduce(\.self) -> 21
    ///
    func reduce<T: AdditiveArithmetic>(_ path: KeyPath<Element, T>) -> T {
        reduce(T.zero) { $0 + $1[keyPath: path] }
    }
}
