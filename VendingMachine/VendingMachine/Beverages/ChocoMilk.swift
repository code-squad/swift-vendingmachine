//
//  ChocoMilk.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 29..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class ChocoMilk: Beverage {
    private let validDuration = 3
    private let itemCode = 2
    private let calorie = 200
    override var type: String {
        return "초코우유"
    }
    init(brand: String, weight: Int, price: Int, name: String, manufactured: String) {
        super.init(brand: brand, weight: weight, price: price, name: name, manufactured: manufactured, valid: self.validDuration, itemCode: self.itemCode, calorie: self.calorie)
    }

    override func isHot() -> Bool {
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
