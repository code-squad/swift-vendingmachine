//
//  TOP.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class TOP: Coffee {
    
    enum CanColor {
        case yellow
        case black
    }
    
    private let canColor: CanColor
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedDate: String, caffeineContent: Double, canColor: CanColor, temperature: Double) {
        self.canColor = canColor
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, caffeineContent: caffeineContent, temperature: temperature)
    }
    
    convenience init() {
        self.init(brand: "티오피", capacity: 200, price: 1500, name: "TOP", manufacturedDate: Date().today, caffeineContent: 40, canColor: .yellow, temperature: 27.5)
    }
}
