//
//  Money.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/20/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct Money {
    private var balance: Int
    
    init() {
        balance = 0
    }
    
    func getBalance () -> Int {
        return balance
    }
    
    mutating func addBalance (_ coin: Int) {
        balance += coin
    }
    
    mutating func minusBalance (_ coin: Int) {
        balance -= coin
    }
}
