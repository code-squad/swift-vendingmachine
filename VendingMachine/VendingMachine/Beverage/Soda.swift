//
//  Soda.swift
//  VendingMachine
//
//  Created by 김지나 on 04/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Soda: Beverage {
    private let calorie: Int
    
    init(calorie: Int, brand: String, capacity: Int, price: Int, productName: String, dateOfManufacture: Date = Date()) {
        self.calorie = calorie
        super.init(brand: brand, capacity: capacity, price: price, productName: productName, dateOfManufacture: dateOfManufacture)
    }
    
    func isHigh() -> Bool {
        return calorie > 400
    }
}
