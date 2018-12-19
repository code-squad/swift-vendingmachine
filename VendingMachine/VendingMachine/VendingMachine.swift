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
    private var products: [String:[Beverage]] = [:]
    
    mutating func insert(money: Int) {
        self.balance += money
    }
    
    mutating func add(product: Beverage) {
        products["\(type(of:product))"] = [product]
    }
}
