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
    
    mutating func deductBeverage(beverageMenu: BeverageMenu, quantity: Int = -1) throws {
        guard isAvailable(beverageMenu: beverageMenu) else {
            throw BeverageErrors.outOfStock
        }
        
        updateQuantity(beverageBox: BeverageBox(beverageMenu: beverageMenu, quantity: quantity))
    }
    
    func countBeverageQuantity(beverageMenu: BeverageMenu) -> Int {
        return self.beverageBoxes.filter({
            if $0.beverageMenu == beverageMenu {
                return true
            }
            
            return false
        }).reduce(0, {$0 + $1.quantity})
    }
    
    func fetchListOfBeverage() -> [BeverageBox] {
        return BeverageMenu.allValues.map({ menu -> BeverageBox in
            BeverageBox(beverageMenu: menu, quantity: countBeverageQuantity(beverageMenu: menu))
        })
        
    }
}

extension Inventory: CustomStringConvertible {
    var description: String {
        return fetchListOfBeverage().reduce("=> ") {
            $0 + $1.beverageMenu.makeInstance().description + "(" + String($1.quantity) + "개) " 
        }
    }
}

private extension Inventory {
    func isAvailable(beverageMenu: BeverageMenu) -> Bool {
        return beverageBoxes.count > 0 && countBeverageQuantity(beverageMenu: beverageMenu) > 0
    }
    
    mutating func updateQuantity(beverageBox: BeverageBox) {
        self.beverageBoxes.append(beverageBox)
    }
}
