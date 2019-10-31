//
//  Beverage.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/21.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Product {
    var isValidate: Bool { get }
    var isHot: Bool { get }
    var objectID: ObjectIdentifier { get }
}

class Beverage {
    private let brand: String
    private let capacity: Int
    private let price: Int
    private let name: String
    private let expirationDate: Date
    private let temperature: Int
    
    private let hotTemperatureCriterion = 20
    
    init(brand: String, capacity: Int, price: Int, name: String, expirationDate: Date, temperature: Int) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.expirationDate = expirationDate
        self.temperature = temperature
    }
}

extension Beverage: Product {
    var isValidate: Bool {
        return expirationDate >= Date()
    }
    
    var isHot: Bool {
        return temperature > hotTemperatureCriterion
    }
    
    var objectID: ObjectIdentifier {
        let objectType = type(of: self)
        
        return ObjectIdentifier(objectType)
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

extension Beverage: Comparable {
    static func < (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func < (lhs: Beverage, rhs: Int) -> Bool {
        return lhs.price < rhs
    }
}
