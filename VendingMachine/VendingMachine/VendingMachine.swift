//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Elena on 02/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    private var money: Int
    
    init(startMoney: Int = 0) {
        self.money = startMoney
    }
    
    mutating func addMoney(money: Int) -> Bool {
        guard money > 0 else { return false }
        self.money += money
        return true
    }
    
}

