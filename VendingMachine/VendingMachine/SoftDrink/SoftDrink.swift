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
    private(set) var containsCarbonicGas: Bool
    private(set) var expirationDate: Date
    private(set) var calories: Int?
    init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ manufacturedDate: Date, containsCarbonicGas: Bool, expirationDate: Date, calories: Int?) {
        self.containsCarbonicGas = containsCarbonicGas
        self.expirationDate = expirationDate
        self.calories = calories
        super.init(brand, volume, price, productName, manufacturedDate)
    }
}

extension SoftDrink {
    func validate(with date:Date) -> Bool {
        guard self.expirationDate <= date else { return false }
        return true
    }

    func isLowCalorie() -> Bool {
        guard let calories = self.calories else { return false }
        if calories < 250 { return true }
        else { return false }
    }
}
