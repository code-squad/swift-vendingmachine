//
//  Inventory.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Inventory {
    private var invetoryBox : [ObjectIdentifier:[Beverage]] = [:]
    
    init(_ productsBox : [Beverage]) {
        for oneProduct in productsBox {
            self.addBeverage(oneProduct)
        }
    }
    
    func getInventory() -> [ObjectIdentifier:[Beverage]] {
        return self.invetoryBox
    }
    
    mutating func addBeverage(_ product : Beverage) {
        if self.invetoryBox.index(forKey: ObjectIdentifier(type(of:product).self)) == nil {
            self.invetoryBox.updateValue([product], forKey: ObjectIdentifier(type(of:product).self))
            return
        }
        self.invetoryBox[ObjectIdentifier(type(of:product).self)]?.append(product)
    }
    
    mutating func removeBeverage(_ product : ObjectIdentifier) -> Beverage? {
        return self.invetoryBox[product]?.removeFirst()
    }
    
}
