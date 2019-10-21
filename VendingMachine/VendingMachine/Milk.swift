//
//  Milk.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/21.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private let isLowFat: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, date: Date, isLowFat: Bool = false) {
        self.isLowFat = isLowFat
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, date: date)
    }
}
