//
//  DateConverter.swift
//  VendingMachine
//
//  Created by Daheen Lee on 31/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class DateConverter {
    static let format = "yyyyMMdd"
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter
    }()
    
    static func toString(from date: Date) -> String {
        return dateFormatter.string(from: date)
    }
    
    static func toDate(from string: String) -> Date {
        return dateFormatter.date(from: string) ?? Date()
    }
}
