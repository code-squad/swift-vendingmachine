//
//  StrawberryMilk.swift
//  VendingMachine
//
//  Created by Daheen Lee on 26/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class StrawberrrMilk: Milk {
    static let flavor = "딸기"
    private let strawberryContent: Int
    
    init(manufacturer: String,
         dateOfManufactured: String,
         expirationDate: String,
         brand: String,
         capacity: Int,
         unit: UnitVolume,
         fatContent: Int,
         strawberryContent: Int,
         price: Int) {
        
        self.strawberryContent = strawberryContent
        let name = "\(StrawberrrMilk.flavor)\(Milk.categoryName)"
        super.init(manufacturer: manufacturer, dateOfManufactured: dateOfManufactured, expirationDate: expirationDate, brand: brand, name: name, capacity: capacity, unit: unit, fatContent: fatContent, price: price)
    }
}
