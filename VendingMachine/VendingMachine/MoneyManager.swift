//
//  MoneyManager.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 15..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class MoneyManager {
    private weak var vendingMachine: VendingMachine!
    // 잔액
    private(set) var balance: Balance
    init(_ vendingMachine: VendingMachine) {
        self.balance = 0
        self.vendingMachine = vendingMachine
    }

    // 삽입 가능한 돈 단위.
    enum Unit: Balance, CustomStringConvertible {
        case oneHundred = 100
        case fiveHundred = 500
        case oneThousand = 1000
        var description: String {
            return String(self.rawValue)
        }
    }

    // 잔액 차감.
    func updateBalance(_ oldStock: Set<Beverage>) {
        // 음료수를 빼먹은 경우(이전 상태가 현재 상태를 포함하는 관계) - self.vendingMachine을 Set 타입으로 직접 쓸 수 없어서 이렇게 사용함.
        if oldStock.isSuperset(of: self.vendingMachine) {
            // 두 집합 사이의 차이 = 빼먹은 음료수
            for beverage in oldStock.symmetricDifference(vendingMachine) {
                // 현재 잔액에서 빼먹은 음료수의 가격만큼을 차감.
                self.balance -= beverage.price
            }
        }
    }

    // 잔액 충전.
    func insert(money: Unit) {
        self.balance += money.rawValue
    }

    // 현재 잔액으로 구입가능한 음료수 리스트 반환.
    func showAffordableList(from sellingList: [VendingMachine.Menu]) -> [VendingMachine.Menu] {
        // 품절이 아닌 음료수 중에서
        return sellingList.filter {
            // 가격이 잔액보다 같거나 작은 음료수들만 반환.
            return self.balance >= $0.price
        }
    }

}
