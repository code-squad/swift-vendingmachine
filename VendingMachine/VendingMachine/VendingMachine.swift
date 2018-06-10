//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    
    var balance: Int = 0
    
    mutating func insertMoney(_ money: Int) {
        self.balance += money
    }
}
