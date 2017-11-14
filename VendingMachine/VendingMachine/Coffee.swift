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
    var amountOfCaffeine: String
    var nameOfCoffeeBeans: String
    
    init(productTpye: String,
         brand: String,
         weight: String,
         price: String,
         name: String,
         dateOfManufacture: String,
         isHot: Bool,
         amountOfCaffeine: String,
         nameOfCoffeeBeans: String) {
        self.isHot = isHot
        self.amountOfCaffeine = amountOfCaffeine
        self.nameOfCoffeeBeans = nameOfCoffeeBeans
        super.init(productTpye: productTpye,
                   brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture)
    }
}

class Top: Coffee { }
class Cantata: Coffee { }
class Georgia: Coffee { }
