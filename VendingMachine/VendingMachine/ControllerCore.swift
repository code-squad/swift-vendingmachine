//
//  ControllerCore.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 20..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class ControllerCore {
    private var inventory = Inventory()
    private var shoppingLists = ShoppingLists()
    private var money = Money()
}

extension ControllerCore: AdminModable, AdminIncome {
    func add(productIndex: Int) throws {
        try inventory.add(productIndex: productIndex)
    }

    @discardableResult func subtract(productIndex: Int) throws -> Beverage {
        return try inventory.subtract(productIndex: productIndex)
    }

    func checkIncome() -> Int {
        return money.checkIncome()
    }

    func listOfInventory() -> [Beverage: Int] {
        return inventory.listOfInventory()
    }

    func checkListOfOverExpirationDate() -> [Beverage] {
        return inventory.checkListOfOverExpirationDate()
    }

    func drinkLists() -> [Beverage] {
        return inventory.drinkLists()
    }
}

extension ControllerCore: UserModable, UserMoney {
    func buy(productIndex: Int) throws -> Beverage {
        let beverage = try inventory.buyBeverage(productIndex: productIndex)
        money.pay(by: beverage.price)
        money.gainIncome(by: beverage.price)
        shoppingLists.buy(beverage)
        try inventory.subtract(productIndex: productIndex)
        return beverage
    }

    func buyableBeverages() -> [Beverage] {
        return inventory.checkBuyableBeverage(by: money.userBalance())
    }

    func insert(by userMoney: Int) {
        money.insert(by: userMoney)
    }

    func userBalance() -> Int {
        return money.userBalance()
    }

    func shoppingHistory() -> ShoppingLists {
        return self.shoppingLists.shoppingHistory()
    }

    @discardableResult func withdrawlBalance() -> Int {
        return money.withdrawlBalance()
    }
}
