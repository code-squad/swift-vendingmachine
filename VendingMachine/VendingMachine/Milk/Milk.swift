//
//  Milk.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 5..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    
    private let tenDaysPeriod: TimeInterval = 86400 * 10
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedDate: String) {
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expiration: 3 * 86400)
    }
    
    required convenience init() {
        self.init(brand: "밀크", capacity: 100, price: 100, name: "우유", manufacturedDate: Date().today)
    }

    
}
