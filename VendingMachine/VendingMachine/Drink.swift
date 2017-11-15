//
//  Drink.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 13..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Drink: CustomStringConvertible {
    var description: String {
        return String(format: "%@ - %@, %@, %@, %@, %@",
                      self.productTpye,
                      self.brand,
                      self.weight,
                      self.price,
                      self.name,
                      self.dateOfManufacture)
    }
    var productTpye: String
    var calorie: Int
    var brand: String
    var weight: String
    var price: String
    var name: String
    var dateOfManufacture: String
    
    init?(productTpye: String,
          calorie: String,
          brand: String,
          weight: String,
          price: String,
          name: String,
          dateOfManufacture: String) {
        self.productTpye = productTpye
        guard let kiloCalorie = calorie.convertToKilocalorie else { return nil }
        self.calorie = kiloCalorie
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.dateOfManufacture = dateOfManufacture
    }
}

