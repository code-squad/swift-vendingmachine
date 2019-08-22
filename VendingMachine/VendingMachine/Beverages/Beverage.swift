//
//  Beverage.swift
//  VendingMachine
//
//  Created by CHOMINJI on 12/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct BeverageStandard {
    static let calorie = 50
    static let temperature = 60
}

class Beverage: CustomStringConvertible {
    private let brand: String
    private let capacity: Int
    private(set) var price: Int
    private(set) var name: String
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

extension Beverage: Comparable {
    static func < (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.price < rhs.price
    }
    
    static func < (lhs: Beverage, rhs: Int) -> Bool {
        return lhs.price < rhs
    }
    
    static func < (lhs: Int, rhs: Beverage) -> Bool {
        return lhs < rhs.price
    }
}

extension Beverage: Equatable {
    static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.name == rhs.name
    }
}

extension Beverage: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
