//
//  Fanta.swift
//  VendingMachine
//
//  Created by hw on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Fanta: CarbonatedDrink {
    private let fruitType: Fruit
    init(brand: String, quantity: Int, price: Int, name: String, date: Date, isSugar: Bool = true, fruitType : Fruit = Fruit.purpleGrape) {
        self.fruitType = fruitType
        super.init(brand: brand, quantity: quantity, price: price, name: name, date: date, isSugar: isSugar)
    }
}
