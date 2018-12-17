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

    mutating func buy(beverage pack: Pack) -> Beverage? {
        guard let beverage = inventory.remove(selected: pack) else { return nil }
        balance = beverage.subtractPrice(from: balance)
        return beverage
    }

}

extension VendingMachine {

    func showListOfAll(with show: (String, Int, Bool) -> Void) {
        let list = inventory.getListOfAll()
        let listBuyable = getListBuyable()
        for pack in list {
            let buyable = listBuyable.contains(pack.key)
            show(pack.key.description, pack.value, buyable)
        }
    }

    func showListOfBuyable(with show: (Bool, Int, String) -> Void) {
        let listBuyable = getListBuyable()
        for (index, packBuyable) in listBuyable.enumerated() {
            let number = index + 1
            let last = (number == listBuyable.count)
            show(last, number, packBuyable.description)
        }
    }

}
