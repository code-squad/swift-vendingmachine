//
//  Inventory.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Inventory {
    private var beverageBoxes: [BeverageBox] = []
    
    mutating func insertBeverage(beverageMenu: BeverageMenu, quantity: Int = 1) {
        updateQuantity(beverageBox: BeverageBox(beverageMenu: beverageMenu, quantity: quantity))
    }
    
    mutating func deductBeverage(beverageMenu: BeverageMenu, quantity: Int = -1) {
        // beverageBoxes.count <= 0
        
        // countQuantity(menu) <= 0
        
        updateQuantity(beverageBox: BeverageBox(beverageMenu: beverageMenu, quantity: quantity))
    }
    
    func countQuantity(beverageMenu: BeverageMenu) -> Int {
        return self.beverageBoxes.filter ({
            if $0.beverageMenu == beverageMenu {
                return true
            }
            
            return false
        }).reduce(0, {$0 + $1.quantity})
    }
}

private extension Inventory {
    mutating func updateQuantity(beverageBox: BeverageBox) {
        self.beverageBoxes.append(beverageBox)
    }
}
