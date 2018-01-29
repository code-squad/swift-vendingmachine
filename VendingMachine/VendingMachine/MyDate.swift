//
//  MyDate.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 27..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct MyDate : CustomStringConvertible {
    private(set) var convertedDate: Date
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

    func expiration(validDuration: Int) -> Bool {
        let currentDate = Date() // 오늘날짜(프로그램 실행날짜) 구하기

        // 파라미터로 받은 사용기한(validDuration)을 통해 유통기한 계산
        let expiration = Calendar.current.date(byAdding: .day, value: validDuration, to: self.convertedDate) ?? Date()

        // 사용기한 + 제조일자 > 오늘날짜 = true
        return currentDate < expiration
    }


}

