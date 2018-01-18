//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class VendingMachine: Userable {    
    private var money: Money
    
    init(money: Money) {
        self.money = money
    }
    
    func insertMoney(coin: Money.Unit) {
        money.insert(coin: coin)
    }
    
    func countChange() -> Change {
        return money.countChange()
    }
}

