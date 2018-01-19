//
//  VendingMachineMock.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 19..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct VendingMachineMock {
    static func supply() -> VendingMachine {
        let vendingMachine = VendingMachine(money: Money(), inventory: Inventory())
        vendingMachine.supply(3)
        return vendingMachine
    }
}
