//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class VendingMachine {
    
    private var balance: Int = 0
    private var stockManager: StockManager
    private var history = [Beverage]()
    
    init(stockManager: StockManager) {
        self.stockManager = stockManager
    }
    
    func insertMoney(_ price: Int) {
        self.balance += price
    }
    
    func readBalance() -> String {
        return "\(self.balance)원"
    }
    
    func add(beverage: Beverage) {
        self.stockManager.add(beverage: beverage)
    }
    
    func readBuyableProducts() -> [ProductType:Int] {
        return self.stockManager.readBuyableProducts(price: self.balance)
    }
    
    func buy(_ productType: ProductType) {
        guard let removed = self.stockManager.buy(productType) else {
            return
        }
        self.balance -= productType.price
        self.history.append(removed)
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
    
    func readPurchaseHistory() -> [Beverage] {
        return self.history
    }
}

extension VendingMachine: Equatable {
    static func == (lhs: VendingMachine, rhs: VendingMachine) -> Bool {
        return lhs.balance == rhs.balance &&
            lhs.stockManager == rhs.stockManager &&
            lhs.history == rhs.history
    }
    
    
}
