//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 18..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    private var balance: Int = 0
    private var productLines: [String:ProductLine] = [:]
    
    mutating func insert(money: Int) {
        self.balance += money
    }
    
    mutating func add(product: Beverage) {
        if self.productLines["\(type(of:product))"] == nil {
            self.productLines["\(type(of:product))"] = ProductLine()
        }
        self.productLines["\(type(of:product))"]?.add(product: product)
    }
    
    func buyableProducts() -> [String] {
        var buyableProducts: [String] = []
        for (_, productLine) in self.productLines {
            guard let buyableProduct = productLine.buyableProduct(money: self.balance) else {continue}
            buyableProducts.append(buyableProduct)
        }
        return buyableProducts
    }
    
    mutating func buy(productName: String) -> Beverage? {
        let product = self.productLines[productName]?.bringOutProduct()
        if self.productLines[productName]?.productCount() == 0 {
            self.productLines[productName] = nil
        }
        return product
    }
    
    func checkBalance() -> String {
        return String(self.balance)
    }
    
    func checkInventory() -> [String:Int] {
        var inventoryStatus: [String:Int] = [:]
        
        for (_, productLine) in self.productLines {
            inventoryStatus[productLine.productName()] = productLine.productCount()
        }
        
        return inventoryStatus
    }
    
    func expiredProducts() -> [Beverage] {
        let expiredProducts: [Beverage] = []
        
        return [MandarineMilk(openDate: Date(before: 43)),CocaCola(openDate: Date(before: 1209)),LactoseFreeMilk(openDate: Date(before: 62))]
    }
}
