//
//  User.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 19..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class User {
    
    let vendingMachine: UserAvailable
    
    init(_ vendingMachine: UserAvailable) {
        self.vendingMachine = vendingMachine
    }
    
    func insertCoint(_ money: Int) {
        self.vendingMachine.insertMoney(money)
    }
    
    func buyBeverage(_ menuNumber: Int) throws {
        let buyables = self.vendingMachine.readBuyableProducts()
        try self.vendingMachine.buy(buyables[menuNumber-1])
    }
}
