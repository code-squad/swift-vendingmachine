//
//  Controller.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Controller {
    private var inventory: [Beverage : Int]
    private var purchases: [Beverage : Int]
    private var money: Int
    init() {
        inventory = [Beverage : Int]()
        purchases = [Beverage : Int]()
        money = 0
    }
    mutating func add(money: Int) {
        self.money += money
    }
    
    mutating func withdrawlBalance() -> Int{
        let change = self.money
        self.money = 0
        return change
    }
    
    mutating func add(product: Beverage)  {
        if let count = inventory[product] {
            inventory[product] = count + 1
        }else {
            inventory[product] = 1
        }
    }
    
    func showListOfBuyableBeverage() -> Array<(key: Beverage, value: Int)> {
        let listOfCanBuy = inventory.filter {
            $0.key.isValidate() &&
            $0.key.isBuyable(balance: self.money) &&
            $0.value != 0
            }.map { $0 }
        return listOfCanBuy
    }
    
    mutating func buy(_ beverage: Beverage) -> Beverage? {
        guard let countOfBeverage = inventory[beverage],
            countOfBeverage != 0 else {
                return nil
        }
        self.inventory[beverage] = countOfBeverage - 1
        self.money -= beverage.price
        guard let countOfListOfPurchase = purchases[beverage] else {
            purchases[beverage] = 1
            return beverage
        }
        purchases[beverage] = countOfListOfPurchase + 1
        return beverage
    }
    
    mutating func buy(productIndex: Int) throws -> Beverage {
        let listOfBuyableBeveragge = self.showListOfBuyableBeverage()
        guard productIndex >= 1 && productIndex <= listOfBuyableBeveragge.count else {
            throw InGameMessage.ofInvalidProductNumber
        }
        guard let beverage = buy(listOfBuyableBeveragge[productIndex-1].key) else {
            throw InGameMessage.ofSoldOut
        }
        return beverage
    }
    
    func checkUserBalance() -> Int {
        return money
    }
    
    func listOfInventory() -> [Beverage : Int] {
        return inventory
    }
    
    func listOfOverExpirationDate() -> [Beverage] {
        return inventory.keys.filter { $0.isValidate() == false }
    }
    
    func showShoppingHistory() -> Array<(key: Beverage, value: Int)> {
        return purchases.map { $0 }
    }
    
}

extension Controller {
    enum InGameMessage: String, Error {
        case ofSoldOut = "해당 음료수는 품절되었습니다."
        case ofInvalidProductNumber = "유효하지 않은 음료수 번호 입니다."
        case insufficientBalance = "잔액이 불충분합니다."
    }
}
