//
//  Beverage.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 5..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage<T: CustomStringConvertible>: CustomStringConvertible {
    
    private let brand: String
    private let capacity: Int
    private let price: Int
    private let name: String
    private let date: Date
    private let flavor: T
    
    init(brand: String, capacity: Int, price: Int, name: String, date: String, flavor: T) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.date = date.customDateFormat
        self.flavor = flavor
    }
    
    var description: String {
        return "\(self.brand), \(self.capacity)ml, \(self.price)원, \(self.name), \(self.date.customDateFormat), \(self.flavor)"
    }
}

extension String {
    var customDateFormat: Date {
        let formatter = DateFormatter(customDateFormat: "yyyyMMdd")
        return formatter.date(from: self) ?? Date()
    }
}

extension Date {
    var customDateFormat: String {
        let formatter = DateFormatter(customDateFormat: "yyyyMMdd")
        return formatter.string(from: self)
    }
}

extension DateFormatter {
    convenience init(customDateFormat: String) {
        self.init()
        self.dateFormat = customDateFormat
    }
}
