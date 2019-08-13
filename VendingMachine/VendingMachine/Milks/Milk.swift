//
//  Milk.swift
//  VendingMachine
//
//  Created by CHOMINJI on 12/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private let dateOfExpiration: Date
    
    init(brand: String, capacity: Int, price: Int, name: String, dateOfManufactured: Date, dateOfExpiration: Date) {
        self.dateOfExpiration = dateOfExpiration
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, dateOfManufactured: dateOfManufactured)
    }
    
    func validate(with date: Date) -> Bool {
        return date < dateOfExpiration
    }
}
