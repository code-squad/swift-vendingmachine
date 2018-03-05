//
//  Milk.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private var flavor: String
    private let validDuration = 3
    private let itemCode = 7
    private let calorie = 130
    private let hot = false
    private let caffeine = 0
    override var type: String {
        return "\(flavor)우유"
    }

    init(flavor: String, brand: String, weight: Int, price: Int, name: String, manufactured: String) {
        self.flavor = flavor
        super.init(brand: brand, weight: weight, price: price, name: name, manufactured: manufactured, valid: self.validDuration, itemCode: self.itemCode, calorie: self.calorie, hot: self.hot, caffeine: self.caffeine)
    }

    override func package() -> Package {
        return .Carton
    }

}
