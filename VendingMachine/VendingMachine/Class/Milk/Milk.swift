//
//  Milk.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/21.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private let lowFatBasis = 0.026
    private let fatContent: Int
    private let capacity: Int
    
    init(brand: String, capacity: Int, price: Int, name: String, date: Date, fatContent: Int) {
        self.fatContent = fatContent
        self.capacity = capacity
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, date: date)
    }
    
    var isLowFat: Bool {
        return Double(fatContent) < Double(capacity) * lowFatBasis
    }
}
