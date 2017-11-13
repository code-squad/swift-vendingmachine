//
//  Coffee.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 13..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Coffee: Drink {
    var taste: Taste
    enum Taste: String {
        case top = "TOP"
        case cantata = "칸타타"
        case georgia = "조지아"
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
        print("\(taste) - ", terminator: "")
        super.printDrinkInfo()
    }

}
