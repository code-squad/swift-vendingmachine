//
//  SoftDrink.swift
//  VendingMachine
//
//  Created by CHOMINJI on 12/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class SoftDrink: Beverage {
    private let calorie: Int
    
    init(brand: String, capacity: Int, price: Int, name: String, dateOfManufactured: Date, calorie: Int) {
        self.calorie = calorie
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, dateOfManufactured: dateOfManufactured)
    }
}
