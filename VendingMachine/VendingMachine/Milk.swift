//
//  Milk.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 13..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Milk: Drink {
    var taste: Taste
    
    enum Taste: String {
        case strawBerry = "딸기우유"
        case banana = "바나나우유"
        case chocolate = "초코우유"
    }
    
    init(taste: Taste,
         brand: String,
         weight: String,
         price: String,
         name: String,
         dateOfManufacture: String) {
        self.taste = taste
        super.init(brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture)
    }
    
    override func printDrinkInfo() {
        print("\(taste.rawValue) - ", terminator: "")
        super.printDrinkInfo()
    }

}
