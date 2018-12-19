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
        guard var productLine = self.productLines["\(type(of:product))"] else {return}
        productLine.add(product: product)
    }
    
    func buyableProducts() -> [Beverage] {
        var buyableProducts: [Beverage] = []
        for productLine in self.productLines.values {
            
        }
        return [LactoseFreeMilk(openDate: Date(before: 3))]
    }
}
