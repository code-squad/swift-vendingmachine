//
//  Milk.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private var flavor: String
    private let validDuration = 3
    private let itemCode = 7
    override var type: String {
        return "\(flavor)우유"
    }

    init(flavor: String, brand: String, weight: Int, price: Int, name: String, manufactured: String) {
        self.flavor = flavor
        super.init(brand: brand, weight: weight, price: price, name: name, manufactured: manufactured, valid: self.validDuration, itemCode: self.itemCode)
    }

    override func isHot() -> Bool {
        return false
    }

    override func isLowCalorie() -> Bool {
        return false
    }

    override func isDecaf() -> Bool {
        return true
    }

    override func package() -> Package {
        return .Carton
    }

    override func isValid() -> Bool {
        return super.isValid()
    }


}
