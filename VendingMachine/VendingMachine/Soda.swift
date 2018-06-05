//
//  Soda.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 5..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Soda: Beverage {
    
    private let flavor: Flavor
    
    enum Flavor {
        case coke
        case sprite
        case fanta
    }
    
    init(brand: String, capacity: Int, price: Int, date: Date, flavor: Flavor) {
        self.flavor = flavor
        super.init(brand: brand, capacity: capacity, price: price, date: date)
    }
}
