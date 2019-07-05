//
//  DateUtil.swift
//  VendingMachine
//
//  Created by jang gukjin on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct DateUtil {
    static private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        
        return dateFormatter
    }()
    
    static func convertDate(of text: String) -> Date{
        return dateFormatter.date(from: text)!
    }
    
    static func convertText(of date: Date) -> String{
        return dateFormatter.string(from: date)
    }
}

