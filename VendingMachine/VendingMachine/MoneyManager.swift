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
    // 현재 잔액
    private(set) var balance: Balance
    init(_ vendingMachine: VendingMachine) {
        self.balance = 0
        self.vendingMachine = vendingMachine
    }

    // 삽입 가능한 돈 단위.
    enum Unit: Balance {
        case oneHundred = 100
        case fiveHundred = 500
        case oneThousand = 1000
    }

    // 잔액 차감.
    func updateBalance(_ oldStock: Set<Beverage>) {
        // 음료수를 빼먹은 경우(이전 상태가 현재 상태를 포함하는 관계). oldStock과 현재 vendingMachine 내 inventory의 count로도 비교 가능.
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
        // 품절이 아닌 음료수 중에서 가격이 잔액보다 같거나 작은 메뉴만 반환.
        return sellingList.filter { self.balance >= $0.price }
    }

}
