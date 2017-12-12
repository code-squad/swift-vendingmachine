//
//  Coffee.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 11..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    // 카페인 함유량, 뜨거운음료여부, 무가당여부, 유통기한, 칼로리
    private let caffeineLevels: Int
    private let isHot: Bool?
    private let isSweetened: Bool?
    private let expirationDate: Date
    private let calories: Int?
    init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ manufacturedDate: Date, caffeineLevels: Int, isHot: Bool?, isSweetened: Bool?, expirationDate: Date, calories: Int?) {
        self.caffeineLevels = caffeineLevels
        self.isHot = isHot
        self.isSweetened = isSweetened
        self.expirationDate = expirationDate
        self.calories = calories
        super.init(brand, volume, price, productName, manufacturedDate)
    }
}

extension Coffee {
    func isDecaffeinated() -> Bool {
        guard caffeineLevels <= 10 else { return false }
        return true
    }

    func isUnSweetened() -> Bool {
        guard let sweetened = self.isSweetened else { return false }
        return !sweetened
    }

    func validate(with date: Date) -> Bool {
        guard self.expirationDate <= date else { return true }
        return false
    }

    func isLowCalorie() -> Bool {
        guard let calories = self.calories else { return false }
        if calories < 150 { return true }
        else { return false }
    }
}
