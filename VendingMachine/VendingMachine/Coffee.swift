//
//  Coffee.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 13..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Coffee: Drink {
    var isHot: Bool
    var amountOfCaffeine: Int
    var nameOfCoffeeBeans: String
    
    init?(productTpye: String,
          calorie: String,
          brand: String,
          weight: String,
          price: String,
          name: String,
          dateOfManufacture: String,
          isHot: Bool,
          amountOfCaffeine: String,
          nameOfCoffeeBeans: String) {
        self.isHot = isHot
        let mg = CharacterSet.init(charactersIn: "mg")
        let mgString = amountOfCaffeine.trimmingCharacters(in: mg)
        guard let amountOfCaffeineNumber = Int(mgString) else { return nil }
        self.amountOfCaffeine = amountOfCaffeineNumber
        self.nameOfCoffeeBeans = nameOfCoffeeBeans
        super.init(productTpye: productTpye,
                   calorie: calorie,
                   brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture)
    }
    
    func isSuitableAmountOfCaffeine(to age: Int) -> Bool {
        if age > 19 && self.amountOfCaffeine == 400 { return true }
        if age <= 19 && self.amountOfCaffeine == 125 { return true }
        return false
    }
    
    func isLowCalorie() -> Bool {
        return self.calorie <= 30 ? true : false
    }

}

class Top: Coffee { }
class Cantata: Coffee { }
class Georgia: Coffee { }
