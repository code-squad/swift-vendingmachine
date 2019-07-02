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
    
    private var inventory = [String: [Beverage]]()
    private var coinsDeposited = 0
    
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
    
    func vend(itemNamed name: String) throws -> Beverage {
        
        guard let beverages = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard beverages.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard beverages[0].price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: beverages[0].price - coinsDeposited)
        }
        
        coinsDeposited -= beverages[0].price
        return inventory[name]!.removeFirst()
    }
}
