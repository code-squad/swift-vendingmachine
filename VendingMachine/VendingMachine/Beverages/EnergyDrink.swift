//
//  EnergyDrink.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 29..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class EnergyDrink: Beverage {
    private let validDuration = 90
    private let itemCode = 6
    override var type: String {
        return "에너지드링크"
    }
    init(brand: String, weight: Int, price: Int, name: String, manufactured: String) {
        super.init(brand: brand, weight: weight, price: price, name: name, manufactured: manufactured, valid: self.validDuration, itemCode: self.itemCode)
    }

    override func isHot() -> Bool {
        return false
    }

    override func isLowCalorie() -> Bool {
        return true
    }

    override func isDecaf() -> Bool {
        return false
    }

    override func package() -> Package {
        return .Can
    }

    override func isValid() -> Bool {
        return super.isValid()
    }

}

