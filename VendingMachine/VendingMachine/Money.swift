//
//  Money.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 21..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Money {
    
    private var balance: Int = 0
    
    func readBalance() -> Int {
        return self.balance
    }
    
    func increaseBalance(_ price: Int) {
        self.balance += price
    }
    
    func decreaseBalance(_ price: Int) {
        self.balance -= price
    }
}
