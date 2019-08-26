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
    
    private let fatContent: Int
    
    init(manufacturer: String,
         dateOfManufactured: String,
         expirationDate: String,
         brand: String,
         name: String,
         capacity: Int,
         unit: UnitVolume,
         fatContent: Int,
         price: Int) {
        
        self.fatContent = fatContent
        super.init(manufacturer: manufacturer, dateOfManufactured: dateOfManufactured, expirationDate: expirationDate, brand: brand, name: name, capacity: capacity, unit: unit, price: price)
    }
    
    convenience init(manufacturer: String,
         dateOfManufactured: String,
         expirationDate: String,
         brand: String,
         capacity: Int,
         unit: UnitVolume,
         fatContent: Int,
         price: Int) {
        
        let name = "\(Milk.categoryName)"
        self.init(manufacturer: manufacturer, dateOfManufactured: dateOfManufactured, expirationDate: expirationDate, brand: brand, name: name, capacity: capacity, unit: unit, fatContent: fatContent, price: price)
    }
}
