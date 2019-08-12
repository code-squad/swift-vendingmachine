//
//  Beverage.swift
//  VendingMachine
//
//  Created by CHOMINJI on 12/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible {
    private let brand: String
    private let capacity: Int
    private let price: Int
    private let name: String
    private let dateOfManufactured: Date
    
    init(brand: String, capacity: Int, price: Int, name: String, dateOfManufactured: Date) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.dateOfManufactured = dateOfManufactured
    }
    
    var description: String {
        return "\(type(of: self)) - \(brand), \(capacity)ml, \(price)원, \(name), \(dateOfManufactured.convertToString())"
    }
}
