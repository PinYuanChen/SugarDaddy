//
// Created on 2022/12/12.
//

import Foundation

extension Date {
    var calendar: Calendar { Calendar.current }
    
    /// SugarDaddy: Year.
    ///
    ///        Date().year -> 2009
    ///
    ///        var someDate = Date()
    ///        someDate.year = 2000 // sets someDate's year to 2000
    ///
    var year: Int {
        get {
            return calendar.component(.year, from: self)
        }
        set {
            guard newValue > 0 else { return }
            let currentYear = calendar.component(.year, from: self)
            let yearsToAdd = newValue - currentYear
            if let date = calendar.date(byAdding: .year, value: yearsToAdd, to: self) {
                self = date
            }
        }
    }
    
    /// SugarDaddy: Month.
    ///
    ///     Date().month -> 2
    ///
    ///     var someDate = Date()
    ///     someDate.month = 12 // sets someDate's month to 12.
    ///
    var month: Int {
        get {
            return calendar.component(.month, from: self)
        }
        set {
            guard let allowedRange = calendar.range(of: .month, in: .year, for: self),
                  allowedRange.contains(newValue) else { return }
            
            let currentMonth = calendar.component(.month, from: self)
            let monthsToAdd = newValue - currentMonth
            if let date = calendar.date(byAdding: .month, value: monthsToAdd, to: self) {
                self = date
            }
        }
    }
    
    /// SugarDaddy: Day.
    ///
    ///     Date().day -> 20
    ///
    ///     var someDate = Date()
    ///     someDate.day = 2 // sets someDate's day of month to 2.
    ///
    var day: Int {
        get {
            return calendar.component(.day, from: self)
        }
        set {
            guard let allowedRange = calendar.range(of: .day, in: .month, for: self),
                  allowedRange.contains(newValue) else { return }
            
            let currentDay = calendar.component(.day, from: self)
            let daysToAdd = newValue - currentDay
            if let date = calendar.date(byAdding: .day, value: daysToAdd, to: self) {
                self = date
            }
        }
    }
    
    /// SugarDaddy: Check if the date is within a weekend period.
    var isInWeekend: Bool {
        return calendar.isDateInWeekend(self)
    }
    
    /// SugarDaddy: Check if the date is within a weekday period.
    var isWorkday: Bool {
        return !calendar.isDateInWeekend(self)
    }
    
}
