//
//  MyDate.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 27..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct MyDate : CustomStringConvertible {
    var customDateFormat = dateFormatter.dateFormat
    private var convertedDate: Date

    var description: String {
        return dateFormatter.string(from: self.convertedDate)
    }

    init(yyyymmdd: String) {
        // dateFormatter 초기화
        let dateFormatter = DateFormatter()
        self.customDateFormat = "yyyyMMdd"
        // 입력된 String으로 Date생성
        self.convertedDate = dateFormatter.date(from: yyyymmdd) ?? Date()
    }

}

