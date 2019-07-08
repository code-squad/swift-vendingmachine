//
//  InputView.swift
//  VendingMachine
//
//  Created by jang gukjin on 08/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    static func readInput(money: Int) -> String? {
        print("현재 투입한 금액이 \(money)원 입니다. 다음과 같은 음료가 있습니다.")
        let answer = readLine()
        return answer
    }
}
