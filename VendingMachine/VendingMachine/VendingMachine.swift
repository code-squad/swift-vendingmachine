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
    private var history: History

    init(beginningBalance: Int = 0, initialInventory: Inventory) {
        self.balance = beginningBalance
        self.inventory = initialInventory
        self.history = History()
    }

    mutating func insert(money: Int) -> Bool {
        guard money > 0 else { return false }
        balance += money
        return true
    }

    func add(beverage: Beverage) {
        inventory.add(beverage: beverage)
    }

    func getListBuyable() -> [Pack] {
        return inventory.getListBuyable(with: balance)
    }

    func getListOfHotBeverages() -> [Pack] {
        return inventory.getListOfHotBeverages()
    }

    func removeExpiredBeverages() -> [Beverage] {
        return inventory.removeExpiredBeverages()
    }

    mutating func buy(beverage pack: Pack) -> Beverage? {
        guard let beverage = inventory.remove(selected: pack) else { return nil }
        balance = beverage.subtractPrice(from: balance)
        history.update(purchase: beverage)
        return beverage
    }

    func isEmpty() -> Bool {
        return inventory.isEmpty()
    }

}

extension VendingMachine {

    func showBalance(with show: (Int) -> Void) {
        show(balance)
    }

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

enum VendingMachineError: Error, MessagePrintable {
    case outOfStock

    var message: String {
        switch self {
        case .outOfStock:
            return "⚠️ 죄송합니다. 모든 품목이 품절되었습니다. ⚠️\n   익일 재고 보충 예정입니다. 감사합니다."
        }
    }
}
