//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    
    private var balance: Int = 0
    private var stock: Stock!
    
    init(stock: Stock) {
        self.stock = stock
    }
    
    mutating func insertMoney(_ price: Int) {
        self.balance += price
    }
    
    func readBalance() -> String {
        return "\(self.balance)원"
    }
    
    func add(beverage: Beverage) {
        
    }
}
