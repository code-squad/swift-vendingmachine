//
//  Beverage.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible, Attribute{
    var type: String {
        return "음료"
    }
    private var brand: String
    private var weight: Int
    private var price: Int
    private var name: String
    private var manufactured: Date
    private let validDuration: Int
    private var itemCode: Int

    var description: String {
        return "\(type) - \(brand) | \(weight)ml | \(price)원 | \(name) | \(manufactured.description)"
    }

    init(brand: String, weight: Int, price: Int, name: String, manufactured: String, valid: Int, itemCode: Int) {
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.manufactured = Date(yyyyMMdd: manufactured)
        self.validDuration = valid
        self.itemCode = itemCode
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

    func getPrice() -> Int {
        return self.price
    }

    func code() -> Int {
        return self.itemCode
    }

    func isValid() -> Bool {
        return self.manufactured.isOutOfDate(validDuration: self.validDuration)
    }

}
