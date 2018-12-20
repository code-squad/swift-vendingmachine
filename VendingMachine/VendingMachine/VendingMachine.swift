//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 윤지영 on 14/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

protocol Consumer {
    func isEmpty() -> Bool
    mutating func insert(money: Int) -> Bool
    func getListBuyable() -> [Pack]
    mutating func buy(beverage: Pack) -> Beverage?
}

protocol Manager {
    func add(beverage: Beverage)
    func getListOfAll() -> [Pack]
    func remove(beverage: Pack) -> Beverage?
    func removeExpiredBeverages() -> [Beverage]
}

protocol PrintableForManager {
    func showListOfAll(with: (String, Int, Bool) -> Void)
    func showListOfExpired(with: (String) -> Void)
    func showHistory(with: (String) -> Void)
}

protocol PrintableForConsumer {
    func showBalance(with: (Int) -> Void)
    func showListOfAllMarked(with: (String, Int, Bool) -> Void)
    func showListOfBuyable(with: (Bool, Int, String) -> Void)
}

struct VendingMachine {
    private var balance: Int
    private var inventory: Inventory
    private var history: History

    init(beginningBalance: Int = 0, initialInventory: Inventory) {
        self.balance = beginningBalance
        self.inventory = initialInventory
        self.history = History()
    }

    func getListOfHotBeverages() -> [Pack] {
        return inventory.getListOfHotBeverages()
    }

    func hasEqualHistory(with theOther: History) -> Bool {
        return self.history == theOther
    }

}

extension VendingMachine: Consumer {

    func isEmpty() -> Bool {
        return inventory.isEmpty()
    }

    mutating func insert(money: Int) -> Bool {
        guard money > 0 else { return false }
        balance += money
        return true
    }

    func getListBuyable() -> [Pack] {
        return inventory.getListBuyable(with: balance)
    }

    mutating func buy(beverage pack: Pack) -> Beverage? {
        guard let beverage = inventory.remove(selected: pack) else { return nil }
        balance = beverage.subtractPrice(from: balance)
        history.update(purchase: beverage)
        return beverage
    }

}

extension VendingMachine: Manager {
    
    func add(beverage: Beverage) {
        inventory.add(beverage: beverage)
    }

    func getListOfAll() -> [Pack] {
        let beverageTypes = [ChocolateMilk.self, StrawberryMilk.self,
                             Sprite.self, Pepsi.self, Cantata.self, Georgia.self]
        var packs: [Pack] = []
        inventory.getListOfAll().forEach { packs.append($0.key) }
        return packs
    }

    func remove(beverage pack: Pack) -> Beverage? {
        guard let beverage = inventory.remove(selected: pack) else { return nil }
        return beverage
    }

    func removeExpiredBeverages() -> [Beverage] {
        return inventory.removeExpiredBeverages()
    }

}

extension VendingMachine: PrintableForManager {

    func showListOfExpired(with show: (String) -> Void) {
        let listExpired = inventory.removeExpiredBeverages()
        listExpired.forEach { show($0.description) }
    }

    func showHistory(with show: (String) -> Void) {
        let listSample = ["음료1", "음료2"]
        listSample.forEach { show($0) }
    }

    func showListOfAll(with show: (String, Int, Bool) -> Void) {
        let list = inventory.getListOfAll()
        for (index, pack) in list.enumerated() {
            let stock = pack.value > 0 ? true : false
            show("\(index+1). \(pack.key.description)", pack.value, stock)
        }
    }

}

extension VendingMachine: PrintableForConsumer {

    func showBalance(with show: (Int) -> Void) {
        show(balance)
    }

    func showListOfBuyable(with show: (Bool, Int, String) -> Void) {
        let listBuyable = getListBuyable()
        for (index, packBuyable) in listBuyable.enumerated() {
            let number = index + 1
            let last = (number == listBuyable.count)
            show(last, number, packBuyable.description)
        }
    }

    func showListOfAllMarked(with show: (String, Int, Bool) -> Void) {
        let list = inventory.getListOfAll()
        let listBuyable = getListBuyable()
        for pack in list {
            let buyable = listBuyable.contains(pack.key)
            show(pack.key.description, pack.value, buyable)
        }
    }

}

enum VendingMachineError: Error, MessagePrintable {
    case outOfStock
    case notExistPack

    var message: String {
        switch self {
        case .outOfStock:
            return "⚠️ 죄송합니다. 모든 품목이 품절되었습니다. ⚠️\n   익일 재고 보충 예정입니다. 감사합니다."
        case .notExistPack:
            return "추가된 적이 없는 음료종류입니다."
        }
    }
}
