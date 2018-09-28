//
//  Cash.swift
//  VendingMachine
//
//  Created by oingbong on 2018. 9. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Cash {    
    private var balance = 0
    
    public func addBalance(with money : Int) {
        self.balance += money
    }

    public func presentBalance() -> Int {
        return self.balance
    }
    
    public func remove(with money: Int) {
        self.balance -= money
    }
}
