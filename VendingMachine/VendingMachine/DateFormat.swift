//
//  DateFormat.swift
//  VendingMachine
//
//  Created by 윤동민 on 28/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct DateFormat {
    static func set() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        formatter.dateFormat = "yyyyMMdd"
        return formatter
    }
    
    static func convertDate(_ date: String) -> Date {
        return DateFormat.set().date(from: date) ?? Date()
    }
}
