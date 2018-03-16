//
//  Controller.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol ControllerCore {
    func userBalance() -> Int
    func withdrawlBalance() -> Int
    func shoppingHistory() -> Array<(key: Beverage, value: Int)>
    func listOfInventory() -> [Beverage : Int]
    func buyableBeverages() -> Array<(key: Beverage, value: Int)>
}

class Controller: ControllerCore {
    private var inventory: [Beverage : Int] = [Beverage : Int]()
    private var purchases: [Beverage : Int] = [Beverage : Int]()
    private var money: Int = 0
    
    func add(money: Int) {
        self.money += money
    }
    
    func withdrawlBalance() -> Int{
        let change = self.money
        self.money = 0
        return change
    }
    
    func add(product: Beverage)  {
        if let count = inventory[product] {
            inventory[product] = count + 1
        }else {
            inventory[product] = 1
        }
    }
    
    func buyableBeverages() -> Array<(key: Beverage, value: Int)> {
        let listOfCanBuy = inventory.filter { $0.key.isValidate() &&
                                                                                        $0.key.isBuyable(balance: self.money)
                                                                                    }.map { $0 }
        return listOfCanBuy
    }
    
    func buy(_ beverage: Beverage) -> Beverage {
        let countOfBeverage = inventory[beverage] ?? 1
        self.inventory[beverage] = countOfBeverage - 1
        self.money -= beverage.price
        guard let countOfListOfPurchase = purchases[beverage] else {
            purchases[beverage] = 1
            return beverage
        }
        purchases[beverage] = countOfListOfPurchase + 1
        return beverage
    }
    
    func buy(productIndex: Int) -> Beverage? {
        let listOfBuyableBeveragge = self.buyableBeverages()
        guard productIndex >= 1 && productIndex <= listOfBuyableBeveragge.count else {
            return nil
        }
        let beverage = buy(listOfBuyableBeveragge[productIndex-1].key)
        return beverage
    }
    
    func userBalance() -> Int {
        return money
    }
    
    func listOfInventory() -> [Beverage : Int] {
        return inventory
    }
    
    func checkListOfOverExpirationDate() -> [Beverage] {
        return inventory.keys.filter { $0.isValidate() == false }
    }
    
    func shoppingHistory() -> Array<(key: Beverage, value: Int)> {
        return purchases.map { $0 }
    }
    
}
