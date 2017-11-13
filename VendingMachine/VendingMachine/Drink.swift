//
//  Drink.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 13..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Drink {
    var brand: String
    var weight: Int
    var price: Int
    var name: String
    var dateOfManufacture: Date
    
    init(brand: String, weight: Int, price: Int, name: String) {
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        dateOfManufacture = Date()
    }
}
