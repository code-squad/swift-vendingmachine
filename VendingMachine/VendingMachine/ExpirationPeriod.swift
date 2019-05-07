//
//  ExpirationPeriod.swift
//  VendingMachine
//
//  Created by Elena on 07/05/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct ExpirationPeriod {
    private let endDate: Int

    init(endDate: Int) {
        self.endDate = endDate
    }

    // 날짜에서 몇일뒤의 날짜를 반환해주는 함수
    func addDate(day: Date) -> Date {
        let addSecond = 86400 * endDate
        let afterDate = Date.init(timeInterval: TimeInterval(addSecond), since: day)
        return afterDate
    }
}
