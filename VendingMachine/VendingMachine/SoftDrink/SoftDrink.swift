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
    private let carbonContent: Int?
    private let expirationDate: Date
    private let calories: Int?
    init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ manufacturedDate: Date, carbonContent: Int?, expirationDate: Date, calories: Int?) {
        self.carbonContent = carbonContent
        self.expirationDate = expirationDate
        self.calories = calories
        super.init(brand, volume, price, productName, manufacturedDate)
    }
}

extension SoftDrink {
    var containsCarbonicGas: Bool {
        guard let carbon = self.carbonContent, carbon > 10 else { return false }
        return true
    }
    
    func validate(with date: Date) -> Bool {
        guard self.expirationDate <= date else { return true }
        return false
    }

    func isLowCalorie() -> Bool {
        guard let calories = self.calories else { return false }
        if calories < 250 { return true }
        else { return false }
    }
}
