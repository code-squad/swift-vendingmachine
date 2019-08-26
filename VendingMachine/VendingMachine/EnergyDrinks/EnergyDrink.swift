//
//  EnergyDrink.swift
//  VendingMachine
//
//  Created by Daheen Lee on 26/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class EnergyDrink: Beverage {
    private let caffeineContent: Int
    
    init(manufacturer: String,
         dateOfManufactured: String,
         expirationDate: String,
         brand: String,
         name: String,
         capacity: Int,
         unit: UnitVolume,
         price: Int,
         caffeineContent: Int) {
        
        self.caffeineContent = caffeineContent
        super.init(manufacturer: manufacturer, dateOfManufactured: dateOfManufactured, expirationDate: expirationDate, brand: brand, name: name, capacity: capacity, unit: unit, price: price)
    }
}
