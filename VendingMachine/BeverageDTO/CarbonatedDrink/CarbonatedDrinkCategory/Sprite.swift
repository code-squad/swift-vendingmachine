//
//  Sprite.swift
//  VendingMachine
//
//  Created by hw on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Sprite: CarbonatedDrink {
    private let coffeine: Double
    init(brand: String, quantity: Int, price: Int, name: String, date: Date, isSugar: Bool = true, coffeine :Double = 100) {
        self.coffeine = coffeine
        super.init(brand: brand, quantity: quantity, price: price, name: name, date: date, isSugar: isSugar)
    }
}
