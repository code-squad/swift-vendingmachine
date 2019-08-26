//
//  Sprite.swift
//  VendingMachine
//
//  Created by Daheen Lee on 23/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Sprite: Soda {
    enum Variant: String, CustomStringConvertible {
        case pearFlavor = "시원한 배향"
        case regular = ""
        
        var description: String {
            return "\(self.rawValue)"
        }
    }
    
    static let brandName = "스프라이트"
    
    private let variant: Variant
    
    init(variant: Variant,
         manufacturer: String,
         dateOfManufactured: String,
         expirationDate: String,
         capacity: Int,
         unit: UnitVolume,
         price: Int) {
        
        self.variant = variant
        let name = "\(variant)"
        super.init(manufacturer: manufacturer, dateOfManufactured: dateOfManufactured, expirationDate: expirationDate, brand: Sprite.brandName, name: name, capacity: capacity, unit: unit, price: price, hasSugar: true)
    }
}
