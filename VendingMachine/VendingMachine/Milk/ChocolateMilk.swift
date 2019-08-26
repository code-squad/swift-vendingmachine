//
//  ChocolateMilk.swift
//  VendingMachine
//
//  Created by Daheen Lee on 26/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {
    static let flavor = "초코"
    private let chocolateContent: Int
    
    init(manufacturer: String,
         dateOfManufactured: String,
         expirationDate: String,
         brand: String,
         capacity: Int,
         unit: UnitVolume,
         fatContent: Int,
         chocolateContent: Int,
         price: Int) {
        
        self.chocolateContent = chocolateContent
        let name = "\(StrawberrrMilk.flavor)\(Milk.categoryName)"
        super.init(manufacturer: manufacturer, dateOfManufactured: dateOfManufactured, expirationDate: expirationDate, brand: brand, name: name, capacity: capacity, unit: unit, fatContent: fatContent, price: price)
    }
    
    
}
