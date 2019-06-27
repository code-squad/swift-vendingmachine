//
//  Date.swift
//  VendingMachine
//
//  Created by 김성현 on 26/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

extension Date {
    
    enum Month: Int {
        case january = 1
        case february
        case march
        case april
        case may
        case june
        case july
        case august
        case september
        case october
        case november
        case december
        
        func stackedDays(year: Int) -> Int {
            var loopCount = 1
            var stackedDays = 0
            while loopCount < self.rawValue {
                stackedDays += Month(rawValue: loopCount)!.rawValue
                loopCount += 1
            }
            return stackedDays
        }
        
        func days(year: Int) -> Int {
            switch self {
            case .april, .june, .september, .november:
                return 30
            case .february:
                return isLeapYear(year) ? 29 : 28
            default:
                return 31
            }
        }
    }
    
    static func sec(fromMinutes minutes: Int) -> TimeInterval {
        return TimeInterval(minutes) * 60
    }
    
    static func sec(fromHours hours: Int) -> TimeInterval {
        let minutes = hours * 60
        return sec(fromMinutes: minutes)
    }
    
    static func sec(fromDays days: Int) -> TimeInterval {
        let hours = days * 24
        return sec(fromHours: hours)
    }
    
    static func stackedYearsFrom1970(year: Int) -> Int {
        
    }
    
    static func isLeapYear(year: Int) -> Bool {
        return year % 4 == 0
    }
    
    static func days(year: Int) -> Int {
        return year % 4 == 0 ? 366 : 365
    }
    
    init?(year: Int, month: Month, day: Int) {
        
        var secFromYears = 0
        let secFromMonths = month.stackedDays(year: year)
        let secFromDays = Date.sec(fromDays: day)
        
        
    }
    
}


