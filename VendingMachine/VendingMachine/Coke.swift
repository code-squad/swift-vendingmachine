//
//  Coke.swift
//  VendingMachine
//
//  Created by Daheen Lee on 31/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coke: Soda {
    enum Variant: String, CustomStringConvertible {
        case diet = "다이어트"
        case zero = "제로"
        case regular = ""
        
        var description: String {
            return "\(self.rawValue)"
        }
    }
    
    private let variant: Variant
    
    init(variant: Variant, manufacturer: String, dateOfManufacture: String, brand: String, capacity: Int, unit: UnitVolume, price: Int) {
    override var productName: String {
        return "\(brand) \(variant)"
    }
        self.variant = variant
        let compositeName = "\(variant)"
        super.init(manufacturer: manufacturer, dateOfManufacture: dateOfManufacture, brand: brand, name: compositeName, capacity: capacity, unit: unit, price: price)
    }
}
