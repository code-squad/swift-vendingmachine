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
    
    init(stockManager: StockManager) {
        self.stockManager = stockManager
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
}
