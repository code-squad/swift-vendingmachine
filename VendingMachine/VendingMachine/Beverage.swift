//
//  Beverage.swift
//  VendingMachine
//
//  Created by 김성현 on 24/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Beverage {
    
    private var brand: String
    private var packageSize: Int
    private(set) var price: Int
    private(set) var name: String
    private var dateOfManufacture: Date
    private var expirationPeriod: TimeInterval
    private var beverageTemperature: Int
    
    init(brand: String, packageSize: Int, price: Int, name: String, dateOfManufacture: Date, expirationPeriod: TimeInterval, beverageTemperature: Int) {
        self.brand = brand
        self.packageSize = packageSize
        self.price = price
        self.name = name
        self.dateOfManufacture = dateOfManufacture
        self.expirationPeriod = expirationPeriod
        self.beverageTemperature = beverageTemperature
    }
    
    var expirationDate: Date {
        return dateOfManufacture + expirationPeriod
    }
    
    func isExpired(targetDate: Date) -> Bool {
        return expirationDate < targetDate
    }
    
    var isHot: Bool {
        return beverageTemperature > 50
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(type(of: self)) - \(brand), \(packageSize)ml, \(price)원, \(name), \(dateOfManufacture)"
    }
}
