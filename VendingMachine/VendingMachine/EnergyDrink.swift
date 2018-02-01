//
//  EnergyDrink.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 29..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class EnergyDrink: Beverage {
    override var type: String {
        return "에너지드링크"
    }
    override init(brand: String, weight: Int, price: Int, name: String, manufactured: String) {
        super.init(brand: brand, weight: weight, price: price, name: name, manufactured: manufactured)
    }

    override func isHot() -> Bool {
        return true
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

    func isValid() -> Bool {
        let validDuration = 90
        return super.validate(duration: validDuration)
    }

}

