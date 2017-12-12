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
    private let packingMaterial: String?
    private let expirationDate: Date
    private let calories: Int?
    init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ manufacturedDate: Date, _ manufacturerCode: Int, packingMaterial: String?, expirationDate: Date, calories: Int?) {
        self.manufacturerCode = manufacturerCode
        self.packingMaterial = packingMaterial
        self.expirationDate = expirationDate
        self.calories = calories
        super.init(brand, volume, price, productName, manufacturedDate)
    }
}

extension Milk {
    func manufactured(from factory: Int) -> Bool {
        guard self.manufacturerCode == factory else { return false }
        return true
    }

    func validate(with date:Date) -> Bool {
        guard self.expirationDate <= date else { return false }
        return true
    }

    func isLowCalorie() -> Bool {
        guard let calories = self.calories else { return false }
        if calories < 150 { return true }
        else { return false }
    }
}
