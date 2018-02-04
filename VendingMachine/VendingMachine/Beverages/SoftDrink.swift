//
//  SoftDrink.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class SoftDrink: Beverage {
    private let validDuration = 365
    override var type: String {
        return "콜라"
    }

    init(brand: String, weight: Int, price: Int, name: String, manufactured: String) {
        super.init(brand: brand, weight: weight, price: price, name: name, manufactured: manufactured, valid: self.validDuration)
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
        return .PET
    }

    override func isValid() -> Bool {
        return super.isValid()
    }

}
