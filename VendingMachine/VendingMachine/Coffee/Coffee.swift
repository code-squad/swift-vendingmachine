//
//  Coffee.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 5..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private let caffeineContent: Double
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedDate: String, caffeineContent: Double) {
        self.caffeineContent = caffeineContent
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate)
    }
    
    func isNonCaffeine() -> Bool {
        return self.caffeineContent == 0
    }
}
