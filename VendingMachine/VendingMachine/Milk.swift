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
    
    enum Flavor: CustomStringConvertible {
        case strawberry
        case banana
        case chocolate
        
        var description: String {
            switch self {
            case .strawberry:
                return "딸기우유"
            case .banana:
                return "바나나우유"
            case .chocolate:
                return "초코우유"
            }
        }
    }
    
    init(brand: String, capacity: Int, price: Int, name: String, date: Date, flavor: Flavor) {
        self.flavor = flavor
        super.init(brand: brand, capacity: capacity, price: price, name: name, date: date)
    }
    
    override var description: String {
        return "\(super.description), \(self.flavor.description)"
    }
}
