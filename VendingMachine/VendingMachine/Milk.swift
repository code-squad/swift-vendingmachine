//
//  Milk.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 13..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Milk: Drink {
    var farmCode: String
    var ingredients: [String]
    lazy var isEasyOfDigestion: () -> Bool = {
        if self.ingredients.contains("lactos") {
            return false
        }
        return true
    }
    
    init(productTpye: String,
         brand: String,
         weight: String,
         price: String,
         name: String,
         dateOfManufacture: String,
         farmCode: String = "Unknown",
         ingredients: [String] = [String]()) {
        self.farmCode = farmCode
        self.ingredients = ingredients
        super.init(productTpye: productTpye,
                   brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture)
    }
        
}

class StrawBerryMilk: Milk {}
class BananaMilk: Milk {}
class ChocolateMilk: Milk {}
