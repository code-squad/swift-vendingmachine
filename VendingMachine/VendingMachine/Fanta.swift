//
//  Fanta.swift
//  VendingMachine
//
//  Created by Daheen Lee on 31/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Fanta: Soda {
    enum Variant: String, CustomStringConvertible {
        case grape = "포도"
        case orange = "오렌지"
        case pineapple = "파인애플"
        
        var description: String {
            return "\(self.rawValue)"
        }
    }
    
    static let manufacturer = "한국코카콜라"
    static let brandName = "환타"
    private let variant: Variant
    override var productName: String {
        return "\(brand) \(variant)"
    }
    
    init(variant: Variant, dateOfManufacture: String, capacity: Int, unit: UnitVolume, price: Int) {
        self.variant = variant
        let compositeName = "\(variant)"
        super.init(manufacturer: Fanta.manufacturer, dateOfManufacture: dateOfManufacture, brand: Fanta.brandName, name: compositeName, capacity: capacity, unit: unit, price: price)
    }
}
