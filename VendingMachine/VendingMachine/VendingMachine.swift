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

    mutating func insert(money: Int) -> Bool {
        guard money > 0 else { return false }
        balance += money
        return true
    }

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

    func showListOfAll(with show: (String, Int) -> Void) {
        let list = inventory.getListOfAll()
        for pack in list {
            show(pack.key.description, pack.value)
        }
    }

}

enum VendingMachineError: Error {
    case outOfStock
}
