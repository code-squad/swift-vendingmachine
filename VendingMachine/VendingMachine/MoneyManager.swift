//
//  MoneyManager.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 15..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class MoneyManager {
    // 잔액
    private var balance: Balance
    init() {
        self.balance = 0
    }

    // 삽입 가능한 돈 단위.
    enum Unit: Int, CustomStringConvertible {
        case oneHundred = 100
        case fiveHundred = 500
        case oneThousand = 1000
        var description: String {
            return String(self.rawValue)
        }
    }

    // 자판기 금액을 원하는 금액만큼 올리는 메소드.
    func insert(money: Unit) {
        self.balance += money.rawValue
    }

    func showAffordableList(from notSoldOutList: [VendingMachine.Menu]) -> [VendingMachine.Menu] {
        // 품절이 아닌 음료수 중에서
        return notSoldOutList.filter {
            // 가격이 잔액보다 같거나 작은 음료수들만 반환.
            return self.balance >= $0.generate().price
        }
    }

}
