//
//  TOP.swift
//  VendingMachine
//
//  Created by hw on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class TOP: Coffee{
    private let coffeeType: CoffeeType

    init(brand: String, quantity: Int, price: Int, name: String, date: Date, coffeine: Double = 100.0, origin: CoffeeBean = CoffeeBean.arabica, type: CoffeeType = CoffeeType.americano) {
        self.coffeeType = type
        super.init(brand: brand, quantity: quantity, price: price, name: name, date: date, coffeine: coffeine, origin: origin)
    }
}
