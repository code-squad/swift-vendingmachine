//
//  Beverage.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 7..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

class Beverage {
    let brand: String
    let weight: Int
    let price: Int
    let name: String
    let dateOfManufacture: Date

    init(brand: String, weight: Int, price: Int, name: String) {
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.dateOfManufacture = Date()
    }

}
