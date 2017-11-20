//
//  ChocolateMilk.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 16..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {
    var ratioOfCocoaPowder: String
    init?(typeOfProduct: String,
          brand: String,
          weight: String,
          price: String,
          name: String,
          dateOfManufacture: String,
          calorie: String,
          farmCode: String = "Unknown",
          ingredients: [String],
          ratioOfCocoaPowder: String) {
        self.ratioOfCocoaPowder = ratioOfCocoaPowder
        super.init(typeOfProduct: typeOfProduct,
                   brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture,
                   calorie: calorie,
                   farmCode: farmCode,
                   ingredients: ingredients)
    }
    
}
