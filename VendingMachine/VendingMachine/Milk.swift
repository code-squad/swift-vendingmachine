//
//  Milk.swift
//  VendingMachine
//
//  Created by 윤동민 on 21/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

// Fat -> 저지방 우유일 경우 False, 고지방 우유일 경우 True
class Milk: Beverage {
    var fat: Bool

    init(name: String, volume: Int, price: Int, brand: String, date: String, fat: Bool) {
        self.fat = fat
        super.init(name: name, volume: volume, price: price, brand: brand, date: date)
    }
}
