//
//  Beverage.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 5..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible {
    
    private let brand: String
    private let capacity: Int
    private let price: Int
    private let name: String
    private let date: Date
    
    init(brand: String, capacity: Int, price: Int, name: String, date: String) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.date = date.customDateFormat ?? Date()
    }
    
    var description: String {
        return "\(self.brand), \(self.capacity)ml, \(self.price)원, \(self.name), \(self.date.customDateFormat)"
    }
}

extension String {
    var customDateFormat: Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.date(from: self)
    }
}

extension Date {
    var customDateFormat: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: self)
    }
}
