//
//  Beverage.swift
//  VendingMachine
//
//  Created by 김성현 on 24/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Beverage {
    
    private(set) var brand: String
    private(set) var packageSize: Int
    private(set) var price: Int
    private(set) var name: String
    private(set) var dateOfManufacture: Date
    private(set) var expirationPeriod: TimeInterval
    
    init(brand: String, packageSize: Int, price: Int, name: String, dateOfManufacture: Date, expirationPeriod: TimeInterval) {
        self.brand = brand
        self.packageSize = packageSize
        self.price = price
        self.name = name
        self.dateOfManufacture = dateOfManufacture
        self.expirationPeriod = expirationPeriod
    }
    
    var expirationDate: Date {
        return dateOfManufacture + expirationPeriod
    }
    
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(brand), \(packageSize)ml, \(price)원, \(name), \(dateOfManufacture)"
    }
}
