//
//  Coffee.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private let validDuration = 30
    private let itemCode = 5
    private let calorie = 150
    private let hot = true
    private let caffeine = 250
    override var type: String {
        return "커피"
    }
    init(brand: String, weight: Int, price: Int, name: String, manufactured: String) {
        super.init(brand: brand, weight: weight, price: price, name: name, manufactured: manufactured, valid: self.validDuration, itemCode: self.itemCode, calorie: self.calorie, hot: self.hot, caffeine: self.caffeine)
    }

    override func package() -> Package {
        return .Can
    }

}

