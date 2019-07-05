//
//  EnergyDrink.swift
//  VendingMachine
//
//  Created by hw on 05/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class EnergyDrink: Drink {
    private let coffeine: Double
    private let isSugarBase: Bool
    
    init(brand: String, quantity: Int, price: Int, name: String, date: Date, isSugarBase: Bool = true, coffeine: Double = 100) {
        self.isSugarBase = isSugarBase
        self.coffeine = coffeine
        super.init(brand: brand, quantity: quantity, price: price, name: name, date: date)
    }
}
