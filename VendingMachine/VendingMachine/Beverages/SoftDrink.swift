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
    private let itemCode = 6
    private let calorie = 500
    private let hot = false
    override var type: String {
        return "콜라"
    }

    init(brand: String, weight: Int, price: Int, name: String, manufactured: String) {
        super.init(brand: brand, weight: weight, price: price, name: name, manufactured: manufactured, valid: self.validDuration, itemCode: self.itemCode, calorie: self.calorie, hot: self.hot)
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
