//
//  Beverage.swift
//  VendingMachine
//
//  Created by Daheen Lee on 29/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible {
    private let manufacturer: String
    private let dateOfManufacture: Date
    private let brand: String
    private let name: String
    private let capacity: Measurement<UnitVolume>
    private let price: Int
    
    var productName: String {
        return "\(brand) \(name)"
    }
    
    init(manufacturer: String, dateOfManufacture: String, brand: String, name: String, capacity: Int, unit: UnitVolume, price: Int) {
        self.manufacturer = manufacturer
        self.dateOfManufacture = DateConverter.toDate(from: dateOfManufacture)
        self.brand = brand
        self.name = name
        self.capacity = Measurement(value: Double(capacity), unit: unit)
        self.price = price
    }
    
    var description: String {
        let formattedDate = DateConverter.toString(from: dateOfManufacture)
        return "\(self.manufacturer), \(self.capacity), \(self.price)원, \(self.productName), \(formattedDate)"
    }
}
