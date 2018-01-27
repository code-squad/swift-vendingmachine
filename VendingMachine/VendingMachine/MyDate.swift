//
//  MyDate.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 27..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct MyDate : CustomStringConvertible {
    private var convertedDate: Date
    private var dateForPrint: String

    var description: String {
        return dateForPrint
    }

    init(YYYYMMDD: String) {
        // dateFormatter 초기화
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"

        // 입력된 String으로 Date생성
        self.convertedDate = dateFormatter.date(from: YYYYMMDD) ?? Date()

        // 생성된 Date을 String으로 변환
        self.dateForPrint = dateFormatter.string(from: self.convertedDate)
    }

}

