//
//  Coffee.swift
//  VendingMachine
//
//  Created by 윤동민 on 21/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum CoffeeKind {
    case cantata
    case top
    case georgia
}

class Coffee: Beverage {
    var kind: CoffeeKind
    
    init(name: String, volume: Int, price: Int, brand: String, date: String, coffeeKind: CoffeeKind) {
        self.kind = coffeeKind
        super.init(name: name, volume: volume, price: price, brand: brand, date: date)
    }
}
