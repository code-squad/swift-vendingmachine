//
//  Coffee.swift
//  VendingMachine
//
//  Created by Daheen Lee on 31/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    enum Variation: String, CustomStringConvertible {
        case americano = "아메리카노"
        case latte     = "라떼"
        case cappuccino = "카푸치노"
        case espresso  = "에스프레소"
        case coldBrew  = "콜드브루"
        
        var description: String {
            return self.rawValue
        }
    }
    
    private let variation: Variation
    override var productName: String {
        return "\(brand) \(variation)"
    }
    
    init(variation: Variation,
         manufacturer: String,
         dateOfManufacture: String,
         brand: String,
         capacity: Int,
         unit: UnitVolume,
         price: Int) {
        
        self.variation = variation
        super.init(manufacturer: manufacturer, dateOfManufacture: dateOfManufacture, brand: brand, name: "", capacity: capacity, unit: unit, price: price)
    }
    
}

