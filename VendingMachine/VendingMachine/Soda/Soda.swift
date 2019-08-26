//
//  Soda.swift
//  VendingMachine
//
//  Created by Daheen Lee on 31/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Soda: Beverage {
    private let hasSugar: Bool
    
    init(manufacturer: String,
         dateOfManufactured: String,
         expirationDate: String,
         brand: String,
         name: String,
         capacity: Int,
         unit: UnitVolume,
         price: Int,
         hasSugar: Bool) {
        
        self.hasSugar = hasSugar
        super.init(manufacturer: manufacturer, dateOfManufactured: dateOfManufactured, expirationDate: expirationDate, brand: brand, name: name, capacity: capacity, unit: unit, price: price)
    }
}
