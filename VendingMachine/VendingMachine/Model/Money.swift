//
//  Money.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Money {
    private var money: Int = 0
    
    mutating func insert(coin: Int) {
        self.money += coin
    }
    
    mutating func deduct(coin: Int) throws {
        guard countChange() > 0 else {
            throw BeverageErrors.notEnoughMoney
        }
        
        self.money -= coin
    }
    
    func countChange() -> Int {
        return self.money
    }
}
