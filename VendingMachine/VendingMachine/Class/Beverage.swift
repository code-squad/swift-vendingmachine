//
//  Beverage.swift
//  VendingMachine
//
//  Created by 이동영 on 13/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Beverage {
    // MARK: - Properties
    private let brand: String
    private let capacity: Int
    private let price: Int
    private let name: String
    private let productDate: Date
    
    // MARK: - Methods
    init(brand: String = "제조사",
         capacity: Int = 0,
         price: Int = 0,
         name: String = "음료",
         productDate: Date = Date()) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.productDate = productDate
    }
}
// MARK: - + CustomStringConvertible
extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(brand), \(capacity)ml, \(price)원, \(name), \(productDate.text)"
    }
}
