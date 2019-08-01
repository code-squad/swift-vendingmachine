//
//  Milk.swift
//  VendingMachine
//
//  Created by Daheen Lee on 31/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    static let categoryName = "우유"
    
    enum Flavor: String, CustomStringConvertible {
        case regular = "흰"
        case strawberry = "딸기"
        case banana = "바나나"
        case chocolate = "초콜렛"
        
        var description: String {
            return self.rawValue
        }
    }
    
    private let flavor: Flavor
    
    override var productName: String {
        return "\(brand) \(flavor)\(Milk.categoryName)"
    }
    
    init(flavor: Flavor,
         manufacturer: String,
         dateOfManufacture: String,
         brand: String,
         capacity: Int,
         unit: UnitVolume,
         price: Int) {
        
        self.flavor = flavor
        super.init(manufacturer: manufacturer, dateOfManufacture: dateOfManufacture, brand: brand, name: "", capacity: capacity, unit: unit, price: price)
    }
}
