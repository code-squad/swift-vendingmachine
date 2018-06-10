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
    
    mutating func insertMoney(_ money: Int) {
        self.balance += money
    }
    
    func checkBalance() -> Int {
        return self.balance
    }
}

enum BeverageName {
    case top
    case cantata
    case georgia
    case strawberryMilk
    case chocoMilk
    case coke
    case sprite
}
