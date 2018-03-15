//
//  Date.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct DateAndTime {
    static let twoWeeksAsSeconds: Double = 1209600
    static let fourtyFiveDaysAsSeconds: Double = 9720000
    static let sixMonthAsSeconds: Double = 15552000
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        formatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        return formatter
    }()

}
