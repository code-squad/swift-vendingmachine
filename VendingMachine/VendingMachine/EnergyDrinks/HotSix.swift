//
//  HotSix.swift
//  VendingMachine
//
//  Created by Daheen Lee on 26/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class HotSix: EnergyDrink {
    static let brandName = "핫식스"
    
    enum Variant: String, CustomStringConvertible {
        case regular = ""
        case light = "라이트"
        case grapefruit = "자몽"
        
        var description: String {
            return self.rawValue
        }
    }
    
    private let variant: Variant
    
    init(variant: Variant,
         manufacturer: String,
         dateOfManufactured: String,
         expirationDate: String,
         capacity: Int,
         unit: UnitVolume,
         price: Int,
         caffeineContent: Int) {
        
        self.variant = variant
        let name = "\(variant)"
        super.init(manufacturer: manufacturer, dateOfManufactured: dateOfManufactured, expirationDate: expirationDate, brand: "\(HotSix.brandName)", name: name, capacity: capacity, unit: unit, price: price, caffeineContent: caffeineContent)
    }
}
