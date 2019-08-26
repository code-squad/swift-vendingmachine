//
//  Cantata.swift
//  VendingMachine
//
//  Created by Daheen Lee on 26/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Cantata: Coffee {
    static let brandName = "칸타타"
    
    enum ContainerType: String, CustomStringConvertible {
        case can = "캔"
        case pet = "페트"
        case pouch = "파우치"
        case bottle = "병"
        case cup = "컵"
        
        var description: String {
            return self.rawValue
        }
    }
    
    private let containerType: ContainerType
    var isHot: Bool = false
    
    init(variation: Variation,
         containerType: ContainerType,
         manufacturer: String,
         dateOfManufactured: String,
         expirationDate: String,
         capacity: Int,
         unit: UnitVolume,
         price: Int) {
        
        self.containerType = containerType
        super.init(variation: variation, manufacturer: manufacturer, dateOfManufactured: dateOfManufactured, expirationDate: expirationDate, brand: Cantata.brandName, capacity: capacity, unit: unit, price: price)
    }
    
    convenience init(variation: Variation,
                     containerType: ContainerType,
                     manufacturer: String,
                     dateOfManufactured: String,
                     expirationDate: String,
                     capacity: Int,
                     unit: UnitVolume,
                     price: Int,
                     isHot: Bool) {
        
        self.init(variation: variation, containerType: containerType, manufacturer: manufacturer, dateOfManufactured: dateOfManufactured, expirationDate: expirationDate, capacity: capacity, unit: unit, price: price)
        self.isHot = isHot
    }
}
