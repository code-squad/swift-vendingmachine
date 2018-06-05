//
//  Milk.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 5..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    
    private let flavor: Flavor
    
    enum Flavor {
        case strawberry
        case banana
        case chocolate
    }
    
    init(brand: String, capacity: Int, price: Int, name: String, date: Date, flavor: Flavor) {
        self.flavor = flavor
        super.init(brand: brand, capacity: capacity, price: price, name: name, date: date)
    }
}
