//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    
    private var balance: Int = 0
    var beverageStock: BeverageStock = BeverageStock()
    
    mutating func insertMoney(_ money: Int) {
        self.balance += money
    }
    
    func checkBalance() -> Int {
        return self.balance
    }
    
    mutating func add(beverage: Beverage) throws {
        try self.beverageStock.add(beverage)
    }
}
