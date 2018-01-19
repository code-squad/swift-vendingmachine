//
//  Inventory.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Inventory {
    private var beverageBoxes: [BeverageBox]
    
    init(_ beverageBoxes: [BeverageBox]) {
        self.beverageBoxes = beverageBoxes
    }
    
    func add(beverageMenu: BeverageMenu, quantity: Int = 1) -> Inventory {
        return updateBeverageBox(beverageBox: BeverageBox(beverageMenu: beverageMenu, quantity: quantity))
    }
    
    func deduct(beverageMenu: BeverageMenu, quantity: Int = -1) throws  -> Inventory {
        guard isAvailable(beverageMenu: beverageMenu) else { throw VendingMachineErrors.outOfStock }
        
        return updateBeverageBox(beverageBox: BeverageBox(beverageMenu: beverageMenu, quantity: quantity))
    }
    
    func countBeverage(beverageMenu: BeverageMenu) -> Int {
        return self.beverageBoxes.filter({
            if $0.beverageMenu == beverageMenu {
                return true
            }
            
            return false
        }).reduce(0, {$0 + $1.quantity})
    }
    
    func fetchListOfBeverage() -> [BeverageBox] {
        return BeverageMenu.allValues.map({ menu -> BeverageBox in
            BeverageBox(beverageMenu: menu, quantity: countBeverage(beverageMenu: menu))
        })
    }
    
}

private extension Inventory {
    func isAvailable(beverageMenu: BeverageMenu) -> Bool {
        return beverageBoxes.count > 0 && countBeverage(beverageMenu: beverageMenu) > 0
    }
    
    func updateBeverageBox(beverageBox: BeverageBox) -> Inventory {
        self.beverageBoxes.append(beverageBox)
        return Inventory(self.beverageBoxes)
    }
}
