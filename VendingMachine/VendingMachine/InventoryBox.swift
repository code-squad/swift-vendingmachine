//
//  InventoryBox.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 15..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class InventoryBox {
    enum VendingMachinError: Error {
        case invalidBeverage
    }
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
    
    func sellDrink(beverage: Beverage) throws -> Beverage {
        let classOfBeverage = ObjectIdentifier(NSClassFromString(beverage.typeOfBeverage) ?? NSObject())
        guard let beverageOfChoice = box[classOfBeverage]?.remove(at: 0) else {
            throw VendingMachinError.invalidBeverage
        }
        return beverageOfChoice
    }
    
    func outOfStockInventory() -> [Beverage] {
        var drinkOfOutOfStock = [Beverage]()
//        for typeOfBeverage in box {
//            for beverage in typeOfBeverage.value {
//                if beverage.typeOfBeverage == "Strawberry" || beverage.typeOfBeverage == "ChocoMilk" || beverage.typeOfBeverage == "BananaMilk" {
//                    Box[.Strawberry].
//
//                    Box[ObjectIdentifier(NSClassFromString("StrawberryMilk")]
//                }
////                if beverage.price < coins {
////                    drinkOfAvailable.append(beverage)
////                }
//            }
//        }
        return drinkOfOutOfStock
    }
    
}


