//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 김성현 on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum VendingMachineError: Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds(coinsNeeded: Int)
}

class VendingMachine {
    
    var inventory = [String: [Beverage]]()
    var coinsDeposited = 0
    
    func insertCoins(_ coins: Int) {
        coinsDeposited += coins
    }
    
    func addItem(_ item: Beverage) {
        if inventory[item.name] == nil {
            inventory[item.name] = [item]
        } else {
            inventory[item.name]!.append(item)
        }
    }
    
    func vend(itemNamed name: String) throws {
        
        
        
    }
}
