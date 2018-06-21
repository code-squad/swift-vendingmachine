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
    private let temperature: Double
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedDate: String, caffeineContent: Double, temperature: Double) {
        self.temperature = temperature
        self.caffeineContent = caffeineContent
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, expiration: 10 * 86400)
    }
    
    required convenience init() {
        self.init(brand: "커피", capacity: 1000, price: 1000, name: "커피", manufacturedDate: Date().today, caffeineContent: 10, temperature: 30)
    }
    
    func isNonCaffeine() -> Bool {
        return self.caffeineContent == 0
    }
    
    func isHot(than temperature: Double) -> Bool {
        return temperature < self.temperature
    }
}
