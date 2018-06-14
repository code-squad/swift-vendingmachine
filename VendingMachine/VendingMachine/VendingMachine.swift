//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct VendingMachine: Equatable {
    
    private var balance: Int = 0
    private var stockManager: StockManager
    private var history: History
    
    init(stockManager: StockManager) {
        self.stockManager = stockManager
        self.history = History(purchased: [Beverage]())
    }
    
    mutating func insertMoney(_ price: Int) {
        self.balance += price
    }
    
    func readBalance() -> String {
        return "\(self.balance)원"
    }
    
    mutating func add(beverage: Beverage) {
        self.stockManager.add(beverage: beverage)
    }
    
    func readBuyableProducts() -> [ProductType:Int] {
        return self.stockManager.readBuyableProducts(price: self.balance)
    }
    
    @discardableResult
    mutating func buy(_ productType: ProductType) -> Beverage? {
        let removed = self.stockManager.buy(productType)
        self.balance -= productType.price
        return removed
    }
    
    func readAllStock() -> [ProductType:Products] {
        return self.stockManager.readAllStock()
    }
    
    func removeExpired() -> [Beverage] {
        return self.stockManager.remove{ $0.isExpired(Date()) }
    }
    
    func removeHot() -> [Beverage] {
        return self.stockManager.remove{ $0.isHot }
    }
    
    mutating func addBeverageInHistory(_ beverage: Beverage) {
        self.history.addPurchased(beverage)
    }
    
    func readPurchaseHistory() -> [Beverage] {
        return self.history.readPurchased()
    }
}
