//
//  Beverage.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible, Attribute, Hashable {
    var hashValue: Int

    static func ==(lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

    var type: String {
        return "음료"
    }
    private var brand: String
    private var weight: Int
    private var price: Int
    private var name: String
    private var manufactured: Date

    var description: String {
        return "\(type) - \(brand) | \(weight)ml | \(price)원 | \(name) | \(manufactured.description)"
    }

    init(brand: String, weight: Int, price: Int, name: String, manufactured: String) {
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.manufactured = Date(yyyyMMdd: manufactured)
    }

    func isHot() -> Bool {
        return true
    }

    func isLowCalorie() -> Bool {
        return true
    }

    func isDecaf() -> Bool {
        return true
    }

    func package() -> Package {
        return .PET
    }

    func validate(duration: Int) -> Bool {
        return self.manufactured.isOutOfDate(validDuration: duration)
    }

}
