//
//  Money.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
struct Money {
    private var userMoney: Int = 0
    private var vendingMachineIncome: Int = 0
}

extension Money: UserMoney {
    mutating func pay(by beveragePrice: Int) {
        self.userMoney -= beveragePrice
    }
    
    mutating func insert(by userMoney: Int) {
        self.userMoney += userMoney
    }
    
    mutating func userBalance() -> Int {
        return userMoney
    }
    
    mutating func withdrawlBalance() -> Int {
        let balance = self.userMoney
        self.userMoney = 0
        return balance
    }
    
}

extension Money: AdminIncome {
    mutating func gainIncome(by beveragePrice: Int) {
        self.vendingMachineIncome += beveragePrice
    }
    
    func checkIncome() -> Int {
        return self.vendingMachineIncome
    }
}

