//
//  Beverage.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/21.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Beverage {
    private let brand: String
    private let capacity: Int
    private let price: Int
    private let name: String
    private let expirationDate: Date
    
    init(brand: String, capacity: Int, price: Int, name: String, expirationDate: Date) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.expirationDate = expirationDate
    }
    
    func validate() -> Bool {
        return expirationDate > Date()
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(expirationDate.text)"
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
