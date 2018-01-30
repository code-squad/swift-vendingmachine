//
//  ChocoMilk.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 29..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class ChocoMilk: Beverage {
    override var type: String {
        return "초코우유"
    }

    override init(brand: String, weight: Int, price: Int, name: String, manufactured: String, itemCode: Int) {
        super.init(brand: brand, weight: weight, price: price, name: name, manufactured: manufactured, itemCode: itemCode)
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

    func isValid() -> Bool {
        let validDuration = 7
        return super.validate(duration: validDuration)
    }


}
