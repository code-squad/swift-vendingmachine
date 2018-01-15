//
//  InventoryBox.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 15..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class InventoryBox {
    var beverageType: NSObject
    var beverageInfo: Beverage
    var number: Int
    var isHotDrink: Bool
    
    init(beverageType: NSObject, beverageInfo:Beverage, number: Int, isHotDrink: Bool) {
        self.beverageType = beverageType
        self.beverageInfo = beverageInfo
        self.number = number
        self.isHotDrink = isHotDrink
    }
    
}
