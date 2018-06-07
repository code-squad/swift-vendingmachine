//
//  Soda.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 5..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Soda: Beverage {
    
    private let calories: Int
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedDate: String, calories: Int) {
        self.calories = calories
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate)
    }
    
    func isLowCalories() -> Bool {
        return self.calories < 100
    }
}

