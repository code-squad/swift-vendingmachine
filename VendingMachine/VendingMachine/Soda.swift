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
    
    enum Flavor: CustomStringConvertible {
        case coke
        case sprite
        case fanta
        
        var description: String {
            switch self {
            case .coke:
                return "콜라"
            case .sprite:
                return "사이다"
            case .fanta:
                return "환타"
            }
        }
    }
    
    init(brand: String, capacity: Int, price: Int, name: String, date: String, flavor: Flavor) {
        self.flavor = flavor
        super.init(brand: brand, capacity: capacity, price: price, name: name, date: date)
    }
    
    override var description: String {
        return "\(super.description), \(self.flavor.description)"
    }
}
