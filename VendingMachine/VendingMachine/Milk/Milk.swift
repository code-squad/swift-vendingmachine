//
//  Milk.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 11..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    // 우유 농장 코드, 뜨거운음료여부, 포장재질, 유통기한, 칼로리
    private let manufacturerCode: Int
    private let isHot: Bool?
    private let packingMaterial: String?
    private let expirationDate: Date
    private let calories: Int?
    init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ manufacturedDate: Date, _ manufacturerCode: Int, isHot: Bool?, packingMaterial: String?, expirationDate: Date, calories: Int?) {
        self.manufacturerCode = manufacturerCode
        self.isHot = isHot
        self.packingMaterial = packingMaterial
        self.expirationDate = expirationDate
        self.calories = calories
        super.init(brand, volume, price, productName, manufacturedDate)
    }
}
