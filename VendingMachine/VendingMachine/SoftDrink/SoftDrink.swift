//
//  SoftDrink.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 11..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class SoftDrink: Beverage {
    // 탄산첨가여부, 유통기한, 칼로리
    private let containsCarbonicGas: Bool
    private let expirationDate: Date
    private let calories: Int?
    init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ manufacturedDate: Date, containsCarbonicGas: Bool, expirationDate: Date, calories: Int?) {
        self.containsCarbonicGas = containsCarbonicGas
        self.expirationDate = expirationDate
        self.calories = calories
        super.init(brand, volume, price, productName, manufacturedDate)
    }
}
