//
//  SoftDrink.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class SoftDrink: Beverage {
    override var type: String {
        return "콜라"
    }

    override init(brand: String, weight: Int, price: Int, name: String, MFDDate: String) {
        super.init(brand: brand, weight: weight, price: price, name: name, MFDDate: MFDDate)
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

    func isValid() -> Bool {
        let validDuration = 365
        return super.validate(duration: validDuration)
    }

}
