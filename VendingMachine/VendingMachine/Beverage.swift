//
//  Beverage.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible {
    var brand: String
    var weight: Int
    var price: Int
    var name: String
    var manufactureDate: Date
    
    init(brand: String, weight: Int, price: Int, name: String, manufactureDate: Date) {
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.manufactureDate = manufactureDate
    }
    var description: String {
        return "\(self.brand), \(self.weight)ml, \(self.price)원, \(self.name), \(self.manufactureDate)"
    }
}
