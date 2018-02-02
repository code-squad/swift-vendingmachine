//
//  DolceLatte.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 2. 1..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class DolceLatte: Beverage {
    override var type: String {
        return "돌체라떼"
    }
    override init(brand: String, weight: Int, price: Int, name: String, manufactured: String) {
        super.init(brand: brand, weight: weight, price: price, name: name, manufactured: manufactured)
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
        return .Bottle
    }

    func isValid() -> Bool {
        let validDuration = 90
        return super.validate(duration: validDuration)
    }

}

