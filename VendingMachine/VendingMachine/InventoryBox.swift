//
//  InventoryBox.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 15..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class InventoryBox {
    var box: [ObjectIdentifier:[Beverage]]
    init() {
        box = [ObjectIdentifier:[Beverage]]()
    }
    
    func storageBeverageStock(beverage: Beverage) { 
        let classOfBeverage = ObjectIdentifier(NSClassFromString(beverage.typeOfBeverage) ?? NSObject())
        if !box.keys.contains(classOfBeverage) {
            box[classOfBeverage] = [Beverage]()
        }
        box[classOfBeverage]?.append(beverage)
    }
    
    func priceLessThan(coins: Int) -> [Beverage] {
        var drinkOfAvailable = [Beverage]()
        for typeOfBeverage in box {
            for beverage in typeOfBeverage.value {
                if beverage.price < coins {
                    drinkOfAvailable.append(beverage)
                }
            }
        }
        return drinkOfAvailable
    }
    
    func sellDrink(beverage: Beverage) -> Beverage{
        let classOfBeverage = ObjectIdentifier(NSClassFromString(beverage.typeOfBeverage) ?? NSObject())
        return box[classOfBeverage]?.remove(at: 0)
    }
    
}


