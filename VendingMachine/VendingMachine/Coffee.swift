//
//  Coffee.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    override var type: String {
        return "커피"
    }
    override init(brand: String, weight: Int, price: Int, name: String, manufactured: String, itemCode: Int) {
        super.init(brand: brand, weight: weight, price: price, name: name, manufactured: manufactured, itemCode: itemCode)
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

