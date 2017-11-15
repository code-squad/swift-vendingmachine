//
//  SoftDrink.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 13..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class SoftDrink: Drink {
    var amountOfSugar: Int
    init?(productTpye: String,
          calorie: String,
          brand: String,
          weight: String,
          price: String,
          name: String,
          dateOfManufacture: String,
          amountOfSugar: String) {
        let g = CharacterSet.init(charactersIn: "g")
        let gString = amountOfSugar.trimmingCharacters(in: g)
        guard let amountOfSugarNumber = Int(gString) else { return nil }
        self.amountOfSugar = amountOfSugarNumber
        super.init(productTpye: productTpye,
                   calorie: calorie,
                   brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture)

    }
    
    func isSuitableAmountOfSugar() -> Bool {
        return self.amountOfSugar < 50 ? true : false
    }
}

class Coke: SoftDrink { }
class Cider: SoftDrink { }
class Fanta: SoftDrink { }
