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
}

extension VendingMachine {
    func fetchPurchasableBeverages() -> [BeverageBox] {
        return checkCurrentInventory().filter ({
            $0.beverageMenu.makeInstance().price <= money.countChange()
        })
    }
    
    func fetchListOfHottedBeverage() -> [BeverageMenu] {
        return allMenus.filter ({
            if let coffee = $0.makeInstance() as? Coffee {
                return coffee.isHot
            }
            
            return false
        })
    }
    
    func fetchListOfValidDate() -> [BeverageMenu] {
        return allMenus.filter ({
            $0.makeInstance().isExpired(with: DateUtility.today())
        })
    }
}

extension VendingMachine: Userable {
    func insertMoney(coin: Int) {
        money.insert(coin: coin)
    }
    
    func deductMoney(coin: Int) throws {
        try money.deduct(coin: coin)
    }
    
    func countChange() -> Int {
        return money.countChange()
    }
    
    func buyBeverage(beverageMenu: BeverageMenu) throws {
        let beverage = beverageMenu.makeInstance()
        guard countChange() > beverage.price else { throw BeverageErrors.notEnoughMoney }
        
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
    
    func checkCurrentInventory() -> [BeverageBox] {
        return inventory.fetchListOfBeverage()
    }
    
    func supply(_ defaultQuantity: Int = 1) {
        allMenus.forEach {
            insertBeverage(beverageMenu: $0, quantity: defaultQuantity)
        }
    }
}

