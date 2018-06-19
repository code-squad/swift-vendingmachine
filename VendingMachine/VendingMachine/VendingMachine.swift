//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

protocol StockManagable {
    func add(beverage: Beverage)
    func readBuyableProducts(price: Int) -> [Products]
    func buy(_ selected: Products) throws -> Beverage
    func readAllStock() -> [ObjectIdentifier:Products]
    func readStock(_ productType: ObjectIdentifier) -> Int
    func remove(_ conditionHandler: (Beverage) -> Bool ) -> [Beverage]
}

class VendingMachine: NSObject, AvailableVendingMachine {
    
    private var balance: Int = 0
    private let stockManager: StockManagable
    private var history: History
    private let hotTemperature: Double = 90.0
    
    init(stockManager: StockManagable, history: History) {
        self.stockManager = stockManager
        self.history = history
    }
    
    func insertMoney(_ price: Int) {
        self.balance += price
    }
    
    func readBalance() -> Int {
        return self.balance
    }
    
    func add(beverage: Beverage) {
        self.stockManager.add(beverage: beverage)
    }
    
    func readBuyableProducts() -> [Products] {
        return self.stockManager.readBuyableProducts(price: self.balance)
    }
    
    func buy(_ products: Products) throws -> Beverage {
        let selected = try self.stockManager.buy(products)
        self.balance = selected.minusBeveragePrice(from: self.balance)
        self.history.addPurchased(selected)
        return selected
    }
    
    func readAllStock() -> [ObjectIdentifier:Products] {
        return self.stockManager.readAllStock()
    }
    
    func removeExpired() -> [Beverage] {
        return self.stockManager.remove{ $0.isExpired(Date()) }
    }
    
    func removeHot() -> [Beverage] {
        return self.stockManager.remove{
            guard let coffee = $0 as? Coffee else {
                return false
            }
            return coffee.isHot(than: 90.0)
        }
    }
    
    func readPurchaseHistory() -> [Beverage] {
        return self.history.readPurchased()
    }
    
    func readStock(_ productType: ObjectIdentifier) -> Int {
        return self.stockManager.readStock(productType)
    }
}

extension VendingMachine {
    enum Error: Swift.Error {
        case insufficientBalance
        
        var errorMessage: String {
            switch self {
            case .insufficientBalance:
                return "잔액이 부족합니다."
            }
        }
    }
}
