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
    
    init(calorie: Int, brand: String, volume: Int, price: Int, productName: String, dateOfManufacture: Date = Date()) {
        self.calorie = calorie
        super.init(brand: brand, volume: volume, price: price, productName: productName, dateOfManufacture: dateOfManufacture, expirationDate: dateOfManufacture + 18144000)
    }
    
    func isHigh() -> Bool {
        return calorie > 400
    }
}

class CocaCola: Soda {
    override init(calorie: Int, brand: String, volume: Int, price: Int, productName: String, dateOfManufacture: Date = Date()) {
        super.init(calorie: calorie, brand: brand, volume: volume, price: price, productName: productName, dateOfManufacture: dateOfManufacture)
    }
}
