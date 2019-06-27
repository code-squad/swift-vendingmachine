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
                stackedDays += Month(rawValue: loopCount)!.days(year: year)
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
    
    static func timeInterval(fromMinutes minutes: Int) -> TimeInterval {
        return TimeInterval(minutes) * 60
    }
    
    static func timeInterval(fromHours hours: Int) -> TimeInterval {
        let minutes = hours * 60
        return timeInterval(fromMinutes: minutes)
    }
    
    static func timeInterval(fromDays days: Int) -> TimeInterval {
        let hours = days * 24
        return timeInterval(fromHours: hours)
    }
    
    static func stackedDaysSince1970(year: Int) -> Int {
        var loopingYear = 1970
        var stackedDays = 0
        while loopingYear < year {
            stackedDays += allDaysOf(year: loopingYear)
            loopingYear += 1
        }
        return stackedDays
    }
    
    static func isLeapYear(_ year: Int) -> Bool {
        return year % 4 == 0
    }
    
    static func allDaysOf(year: Int) -> Int {
        return isLeapYear(year) ? 366 : 365
    }
    
    init?(year: Int, month: Month, day: Int) {
        guard day <= month.days(year: year) else {
            return nil
        }
        let daysFromYear = Date.stackedDaysSince1970(year: year)
        let daysFromMonth = month.stackedDays(year: year)
        
        let allDays = daysFromYear + daysFromMonth + day - 1
        
        self = Date(timeIntervalSince1970: Date.timeInterval(fromDays: allDays))
    }
    
}
