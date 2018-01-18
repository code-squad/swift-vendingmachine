//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class VendingMachine {
    private var money: Money
    private var inventory: Inventory
    
    init(money: Money, inventory: Inventory) {
        self.money = money
        self.inventory = inventory
    }
    
    func fetchPurchasableBeverages() -> [BeverageBox] {
        return inventory.fetchListOfBeverage().filter ({
            $0.beverageMenu.makeInstance().price <= money.countChange()
        })
    }
    
    func fetchListOfHottedBeverage() -> [BeverageMenu] {
        return BeverageMenu.allValues.filter ({
            if let coffee = $0.makeInstance() as? Coffee {
                return coffee.isHot
            }
            
            return false
        })
    }
    
    func fetchListOfValidDate() -> [BeverageMenu] {
        return BeverageMenu.allValues.filter ({
            $0.makeInstance().isExpired(with: DateUtility.today())
        })
    }
    
    
    func deductMoney(coin: Int) throws {
        try money.deduct(coin: coin)
    }
}

extension VendingMachine: Userable {
    func insertMoney(coin: Money.Unit) {
        money.insert(coin: coin)
    }
    
    func countChange() -> Int {
        return money.countChange()
    }
    
    func buyBeverage(beverageMenu: BeverageMenu) throws {
        let beverage = beverageMenu.makeInstance()
        try deductBeverage(beverageMenu: beverageMenu)
        try deductMoney(coin: beverage.price)
    }
}

extension VendingMachine: VendingMachineManagerable {
    func insertBeverage(beverageMenu: BeverageMenu, quantity: Int = 1) {
        inventory.insertBeverage(beverageMenu: beverageMenu, quantity: quantity)
    }
    
    func deductBeverage(beverageMenu: BeverageMenu, quantity: Int = -1) throws {
        try inventory.deductBeverage(beverageMenu: beverageMenu, quantity: quantity)
    }
    
    func countBeverageQuantity(beverageMenu: BeverageMenu) -> Int {
        return inventory.countBeverageQuantity(beverageMenu: beverageMenu)
    }
}

