//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 18..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct VendingMachine: VendingMachineInfo {
    private var balance: Int = 0
    private var productLines: [String:ProductLine] = [:]
    private(set) var historyOfPurchase: [Beverage] = []
    
    mutating func insert(money: Int) {
        self.balance += money
    }
    
    mutating func add(product: Beverage) {
        if self.productLines["\(type(of:product))"] == nil {
            self.productLines["\(type(of:product))"] = ProductLine()
        }
        self.productLines["\(type(of:product))"]?.add(product: product)
    }
    
    func buyableProducts() -> [String:String] {
        var buyableProducts: [String:String] = [:]
        for (key, productLine) in self.productLines {
            guard let buyableProduct = productLine.buyableProduct(money: self.balance) else {continue}
            buyableProducts[key] = buyableProduct
        }
        return buyableProducts
    }
    
    mutating func buy(productName: String) -> Beverage? {
        let product = self.productLines[productName]?.bringOutProduct()
        if self.productLines[productName]?.productCount() == 0 {
            self.productLines[productName] = nil
        }
        if let product = product {
            self.historyOfPurchase.append(product)
            self.balance = pay(product: product)
        }
        return product
    }
    
    private func pay(product: Beverage) -> Int {
        let pay: (Int) -> Int = { (price: Int) -> Int in
            return self.balance - price
        }
        return product.pay(pay: pay)
    }
    
    func checkBalance() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: self.balance as NSNumber) ?? ""
    }
    
    func checkInventory() -> [String:Int] {
        var inventoryStatus: [String:Int] = [:]
        
        for (_, productLine) in self.productLines {
            inventoryStatus[productLine.productName()] = productLine.productCount()
        }
        
        return inventoryStatus
    }
    
    func expiredProducts() -> [Beverage] {
        var expiredProducts: [Beverage] = []
        
        for (_, productLine) in self.productLines {
            expiredProducts.append(contentsOf: productLine.expiredProducts())
        }
        
        return expiredProducts
    }
    
    func hotProducts() -> [String] {
        var hotProducts: [String] = []
        
        for (_, productLine) in self.productLines {
            guard let broughtProduct = productLine.hotProducts() else {continue}
            hotProducts.append(broughtProduct)
        }
        
        return hotProducts
    }
}
