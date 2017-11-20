//
//  Fanta.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 16..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Fanta: SoftDrink {
    var tase: Taste
    enum Taste {
        case orange
        case pineapple
        case grape
    }
    init?(typeOfProduct: String,
          calorie: String,
          brand: String,
          weight: String,
          price: String,
          name: String,
          dateOfManufacture: String,
          amountOfSugar: String,
          taste: Taste) {
        self.tase = taste
        super.init(typeOfProduct: typeOfProduct,
                   calorie: calorie,
                   brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture,
                   amountOfSugar: amountOfSugar)
    }
}
