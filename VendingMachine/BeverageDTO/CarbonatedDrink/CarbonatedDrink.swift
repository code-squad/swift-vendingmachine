//
//  CarbonatedDrink.swift
//  VendingMachine
//
//  Created by hw on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

/// 설탕기반, 무설탕 기반에 따른 프로퍼티 추가
class CarbonatedDrink: Drink {
    private var isSugarBase : Bool
    init(brand: String, quantity: Int, price: Int, name: String, date: Date, isSugar: Bool = true) {
        self.isSugarBase = isSugar
        super.init(brand: brand, quantity: quantity, price: price, name: name, date: date)
    }
}
