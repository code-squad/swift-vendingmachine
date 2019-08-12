//
//  Beverage.swift
//  VendingMachine
//
//  Created by CHOMINJI on 12/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible {
    let brand: String
    let capacity: Int
    let price: Int
    let name: String
    let dateOfManufactured: Date
    
    init(brand: String, capacity: Int, price: Int, name: String, dateOfManufactured: Date) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.dateOfManufactured = dateOfManufactured
    }
    
    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(dateOfManufactured.convertToString())"
    }
}
