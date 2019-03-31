//
//  Date.swift
//  VendingMachine
//
//  Created by Elena on 28/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

extension Date {
    //출력을 위해 날짜 변경 해주는 함수
    static func changeDate(beforeDate: Date) -> String {
        let dataForm = DateFormatter()
        dataForm.dateFormat = "yyyyMMdd"
        let afterDate = dataForm.string(from: beforeDate)
        return afterDate
    }
    
    // String으로 날짜를 받았을때 Date로 변경 해주는 함수
    static func changeString(beforeDate: String) -> Date {
        let dateString: String = beforeDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        
        let date:Date = dateFormatter.date(from: dateString) ?? Date()
        
        return date
    }
    
    // 날짜에서 몇일뒤의 날짜를 반환해주는 함수
    static func addDate(addDay: Int , day: Date) -> Date {
        let addSecond = 86400 * addDay
        let afterDate = Date.init(timeInterval: TimeInterval(addSecond), since: day)
        return afterDate
    }
    
    // 날짜 비교
    static func isEqualDate(manufacturedDate: Date) -> Bool{
        let nowDate = Date()
        if manufacturedDate < nowDate {
            return false
        }
        return true
    }
}



