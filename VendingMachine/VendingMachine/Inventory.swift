//
//  Inventory.swift
//  VendingMachine
//
//  Created by oingbong on 2018. 9. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Inventory {
    static let shared = Inventory() // for Singleton
    
    private var beverages: [[Beverage]]
    
    init() {
        var beverages = [[Beverage]]()
        let numberOfBeverageType = Int.random(in: 4...8)
        for _ in 1...numberOfBeverageType {
            let numberPerItem = Int.random(in: 1...9)
            let beverage = RandomBeverage.random(select: numberPerItem)
            beverages.append(beverage)
        }
        self.beverages = beverages
    }
    
    public func list() -> [[Beverage]] {
        return self.beverages
    }
    
    public func remove(target: Int) {
        let index = target - 1
        self.beverages[index].removeFirst()
    }
}
