//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Elena on 02/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

typealias BuyableResultPrintClosure = (Bool, Int, String) -> Void
typealias AllListResultPrintClosure = (String, Int, Bool) -> Void

struct VendingMachine {
    private var money: Money
    private var list: Inventory
    private var history: History

    
    init(startMoney: Int = 0 , list: Inventory) {
        self.money = Money(money: startMoney)
        self.list = list
        self.history = History()
    }
    
    func buyAvailableHotBeverages() -> [Packages] {
        return list.buyAvailableHotBeverages()
    }
    
    func hasEqualHistory(with theOther: History) -> Bool {
        return self.history == theOther
    }

}

// MARK: - Protocol Manager
protocol Manager {
    func add(beverage: Beverage)
    func remove(beverage: Int) -> Beverage?
    func removeGoBadBeverages() -> [Beverage]
}

// MARK: - Extension VendingMachine: Manger
extension VendingMachine: Manager {
    // 재고를 관리하기 위한 함수
    func remove(beverage: Int) -> Beverage? {
        return nil
    }
    
    func add(beverage: Beverage) {
        list.add(beverage: beverage)
    }
    
    func removeGoBadBeverages() -> [Beverage] {
        return list.removeGoBadBeverages()
    }
    
}

// MARK: - Protocol Customer
protocol Customer {
    func isEmpty() -> Bool
    func isPut(cash: Int) -> Bool
    func buyAvailableList() -> [Packages]
    mutating func buyBeverage(package: Packages) -> Beverage?
}

// MARK: - Extension VendingMachine: Customer
extension VendingMachine: Customer {
    
    func isEmpty() -> Bool {
        return list.isEmpty()
    }
    
    func isPut(cash: Int) -> Bool {
        return money.addMoney(put: cash)
    }
    
    func buyAvailableList() -> [Packages] {
        return list.buyAvailableList(money: money)
    }
    
    mutating func buyBeverage(package: Packages) -> Beverage? {
        guard let beverage = list.remove(select: package) else { return nil }
        beverage.subtract(pay: money)
        history.add(purchase: beverage)
        
        return beverage
    }
    
}

// MARK: - Protocol VendingMachineShow
protocol VendingMachineShow {
    func showList(show: (Int) -> Void)
    func showListOfAll(list: AllListResultPrintClosure)
    func showListOfBuyable(list: BuyableResultPrintClosure)
}

// MARK: - Extension VendingMachine: VendingMachineShow
extension VendingMachine: VendingMachineShow {
    
    func showList(show: (Int) -> Void) {
        show(money.showMoney())
    }
    
    func showListOfAll(list show: AllListResultPrintClosure) {
        let lists = list.getListOfAll()
        let listBuyable = buyAvailableList()
        for pack in lists {
            let buyable = listBuyable.contains(pack.key)
            show(pack.key.description, pack.value, buyable)
        }
    }
    
    func showListOfBuyable(list show: BuyableResultPrintClosure) {
        let listBuyable = buyAvailableList()
        for (index, packBuyable) in listBuyable.enumerated() {
            let number = index + 1
            let last = (number == listBuyable.count)
            show(last, number, packBuyable.description)
        }
    }
}
