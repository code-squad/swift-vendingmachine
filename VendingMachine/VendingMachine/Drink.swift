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
        return String(format: "%@(%@) - %@, %@, %@, %@, %@",
                      self.productTpye,
                      self.className,
                      self.brand,
                      self.weight,
                      self.price,
                      self.name,
                      self.dateOfManufacture)
    }
    private(set) var productTpye: String
    private(set) var calorie: Int
    private(set) var brand: String
    private(set) var weight: String
    private(set) var price: String
    private(set) var name: String
    private(set) var dateOfManufacture: String
    var className: String {
        get {
            return String(describing: Drink.self)
        }
    }
    
    init?(productTpye: String,
          calorie: String,
          brand: String,
          weight: String,
          price: String,
          name: String,
          dateOfManufacture: String) {
        self.productTpye = productTpye
        guard let kiloCalorie = calorie.convert(to: "kcal") else { return nil }
        self.calorie = kiloCalorie
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.dateOfManufacture = dateOfManufacture
    }
}

