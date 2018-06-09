//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    
    var insertedMoney: Int = 0
    var beverageStock: [Beverage] = [Beverage]()
    
    mutating func insertMoney(_ money: Int) {
        self.insertedMoney += money
    }
    
    mutating func addBeverageStock(_ beverage: Beverage) {
        self.beverageStock.append(beverage)
    }
}
