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
    
    static func changeString(beforeDate: String) -> Date {
        let dateString: String = beforeDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        
        let date:Date = dateFormatter.date(from: dateString) ?? Date()
        
        return date
    }
}



