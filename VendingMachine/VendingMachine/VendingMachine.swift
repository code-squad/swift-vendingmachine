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
    private var list: Inventory
    
    init(startMoney: Int = 0 , list: Inventory) {
        self.money = startMoney
        self.list = list
    }
    
    mutating func addMoney(money: Int) -> Bool {
        guard money > 0 else { return false }
        self.money += money
        return true
    }
    
    func add(beverage: Beverage) {
        list.add(beverage: beverage)
    }
    
    
}

