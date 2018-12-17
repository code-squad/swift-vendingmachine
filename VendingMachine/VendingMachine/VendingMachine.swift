//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 윤지영 on 14/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    private var balance: Int
    private var inventory: Inventory

    init(beginningBalance: Int = 0, initialInventory: Inventory) {
        self.balance = beginningBalance
        self.inventory = initialInventory
    }

//    자판기 금액을 원하는 금액만큼 올리는 메소드
    mutating func insert(money: Int) -> Bool {
        guard money > 0 else { return false }
        balance += money
        return true
    }

//    잔액을 확인하는 메소드
    func showBalance(with show: (Int) -> Void) {
        show(balance)
    }

    func add(beverage: Beverage) {
        inventory.add(beverage: beverage)
    }

    func getListBuyable() -> [Pack] {
        return inventory.getListBuyable(with: balance)
    }

    func buy(beverage pack: Pack) throws -> Beverage {
        guard let beverage = inventory.remove(selected: pack) else { throw VendingMachineError.outOfStock }
        return beverage
    }
//    시작이후 구매 상품 이력을 배열로 리턴하는 메소드

}

enum VendingMachineError: Error {
    case outOfStock
}
