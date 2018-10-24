//
//  User.swift
//  VendingMachine
//
//  Created by 이동건 on 24/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class User {
    private weak var machine: VendingMachineUserDelegate!
    var bundles: Bundles {
        return machine.bundles
    }
    var history: History {
        return machine.userHistory
    }
    var remain: Int {
        return machine.remain
    }
    
    init(_ machine: VendingMachineUserDelegate) {
        self.machine = machine
    }
    
    func buy(at index: Int) throws -> (Beverage, Int) {
        if index < 0 || index > bundles.count { throw VendingMachineError.wrongInput }
        return try machine.buy(at: index)
    }
    
    func deposit(_ money: Int) throws {
        if money < 0 { throw VendingMachineError.wrongInput }
        machine.deposit(money)
    }
}
