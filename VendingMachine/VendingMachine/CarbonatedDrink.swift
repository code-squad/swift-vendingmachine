//
//  CarbonatedDrink.swift
//  VendingMachine
//
//  Created by 김성현 on 25/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CarbonatedDrink: Beverage {
    var calorie: Int
    
    init(brand: String, packageSize: Int, price: Int, name: String, calorie: Int, dateOfManufacture: Date) {
        self.calorie = calorie
        super.init(brand: brand, packageSize: packageSize, price: price, name: name, dateOfManufacture: dateOfManufacture)
    }
}
