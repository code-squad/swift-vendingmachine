//
//  Coke.swift
//  VendingMachine
//
//  Created by Daheen Lee on 31/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coke: Soda {
    enum Brand: String, CustomStringConvertible {
        case cocaCola = "코카콜라"
        case pepsiCola = "펩시"
        
        var description: String {
            return "\(self.rawValue)"
        }
    }
    
    enum Variant: String, CustomStringConvertible {
        case diet = "다이어트"
        case zero = "제로"
        case regular = ""
        
        var description: String {
            return "\(self.rawValue)"
        }
        
        var hasSugar: Bool {
            switch self {
            case .zero:
                return false
            default:
                return true
            }
        }
    }
    
    private let variant: Variant
    
    init(variant: Variant,
         manufacturer: String,
         dateOfManufactured: String,
         expirationDate: String,
         brand: Brand,
         capacity: Int,
         unit: UnitVolume,
         price: Int) {
        
        self.variant = variant
        let name = "\(variant)"
        let hasSugar = variant.hasSugar
        super.init(manufacturer: manufacturer, dateOfManufactured: dateOfManufactured, expirationDate: expirationDate, brand: "\(brand)", name: name, capacity: capacity, unit: unit, price: price, hasSugar: hasSugar)
    }
}
