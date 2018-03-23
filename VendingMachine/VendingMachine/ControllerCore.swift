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
    
    func subtract(productIndex: Int) throws -> Beverage {
        return try inventory.subtract(productIndex: productIndex)
    }
    
    func checkIncome() -> Int {
        return money.checkIncome()
    }
    
    func listOfInventory() -> [Beverage : Int] {
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
        let drinks = buyableBeverages()
        guard drinks.indices.contains(productIndex - 1) else {
            throw stockError.invalidProductNumber
        }
        let purchasedBeverage = drinks[productIndex - 1]
        for beverage in inventory.beverages.enumerated() {
            if beverage.element == purchasedBeverage {
                self.money.userMoney -= purchasedBeverage.price
                money.vendingMachineIncome += purchasedBeverage.price
                self.money.vendingMachineIncome += purchasedBeverage.price
                _ = try self.inventory.subtract(productIndex: beverage.offset)
                self.shoppingLists.buy(purchasedBeverage)
                return purchasedBeverage
            }
        }
        throw stockError.soldOut
    }
    
    func insertMoney(userMoney: Int) {
        money.insertMoney(userMoney: userMoney)
    }
    
    func buyableBeverages() -> [Beverage] {
        let listOfCanBuy = inventory.beverages.filter { $0.isValidate() &&
            $0.price <= userBalance()
        }
        return listOfCanBuy
    }
    
    func userBalance() -> Int {
        return money.userBalance()
    }
    
    func shoppingHistory() -> ShoppingLists {
        return self.shoppingLists.shoppingHistory()
    }
    
    func withdrawlBalance() -> Int {
        return money.withdrawlBalance()
    }
}

extension ControllerCore {
    enum stockError: CustomStringConvertible, Error {
        case soldOut
        case invalidProductNumber
        case empty
        var description: String {
            switch self {
            case .soldOut: return "해당 음료수는 품절되었습니다."
            case .invalidProductNumber : return "유효하지 않은 음료수 번호 입니다."
            case .empty : return "재고가 하나도 없습니다."
            }
        }
    }
}

