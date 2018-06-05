//
//  Coffee.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 5..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    
    private let flavor: Flavor
    
    enum Flavor {
        case top
        case georgia
        case cantata
    }
    
    init(brand: String, capacity: Int, price: Int, name: String, date: Date, flavor: Flavor) {
        self.flavor = flavor
        super.init(brand: brand, capacity: capacity, price: price, name: name, date: date)
    }
}
