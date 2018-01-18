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
    
    func insertBeverage(beverageMenu: BeverageMenu, quantity: Int = 1) {
        inventory.insertBeverage(beverageMenu: beverageMenu, quantity: quantity)
    }
    
    func deductBeverage(beverageMenu: BeverageMenu, quantity: Int = -1) throws {
        try inventory.deductBeverage(beverageMenu: beverageMenu, quantity: quantity)
    }
    
    func countBeverageQuantity(beverageMenu: BeverageMenu) -> Int {
        return inventory.countBeverageQuantity(beverageMenu: beverageMenu)
    }
    
    func fetchPurchasableBeverages() -> [BeverageBox] {
        return inventory.fetchListOfBeverage().filter ({
            $0.beverageMenu.makeInstance().price <= money.countChange()
        })
    }
}

extension VendingMachine: Userable {
    func insertMoney(coin: Money.Unit) {
        money.insert(coin: coin)
    }
    
    func countChange() -> Int {
        return money.countChange()
    }
    
    func deductMoney(coin: Money.Unit) throws {
        try money.deduct(coin: coin)
    }
}

