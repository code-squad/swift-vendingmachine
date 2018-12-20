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
    
    func buy(product: String) -> Beverage {
        
        return CocaCola(openDate: Date(before: 2))
    }
}
