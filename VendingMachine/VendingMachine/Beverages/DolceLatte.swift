//
//  DolceLatte.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 2. 1..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class DolceLatte: Beverage {
    private let validDuration = 30
    private let itemCode = 3
    private let calorie = 550
    private let hot = true
    override var type: String {
        return "돌체라떼"
    }
     init(brand: String, weight: Int, price: Int, name: String, manufactured: String) {
        super.init(brand: brand, weight: weight, price: price, name: name, manufactured: manufactured, valid: self.validDuration, itemCode: self.itemCode, calorie: self.calorie, hot: self.hot)
    }

    override func isDecaf() -> Bool {
        return false
    }

    override func package() -> Package {
        return .Bottle
    }

    override func isValid() -> Bool {
        return super.isValid()
    }

}

