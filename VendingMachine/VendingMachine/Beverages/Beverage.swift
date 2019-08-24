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

protocol Product {
    var productName: String { get }
    var productPrice: Int { get }
    var isHot: Bool { get }
    var isExpired: Bool { get }
}

class Beverage: CustomStringConvertible, Product {
    private let brand: String
    private let capacity: Int
    private let price: Int
    private let name: String
    private let dateOfManufactured: Date
    private let temperature: Int
    private let shelfLife: Double
    
    init(brand: String, capacity: Int, price: Int, name: String, dateOfManufactured: Date, temperature: Int, shelfLife: Double) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.dateOfManufactured = dateOfManufactured
        self.temperature = temperature
        self.shelfLife = TimeInterval(SecondOfDay.second) * 7
    }
    
    var description: String {
        return "\(type(of: self)) - \(brand), \(capacity)ml, \(price)원, \(name), \(dateOfManufactured.convertToString())"
    }
    
    var isHot: Bool {
        return temperature > BeverageStandard.temperature
    }
    
    var isExpired: Bool {
        return dateOfManufactured + shelfLife < Date()
    }
    
    func showBeverage(with completion: (String, Int) -> Void) {
        completion(name, price)
    }
    
    var productName: String {
        return name
    }
    
    var productPrice: Int {
        return price
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
