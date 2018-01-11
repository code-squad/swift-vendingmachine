//
//  Coffe.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private let fatRate: Int
    
    init(brand: String, volume: Int, price: Int, productName: String, expiryDate: Date, calorie: Int, fatRate: Int) {
        self.fatRate = fatRate
        super.init(brand: brand, volume: volume, price: price, productName: productName, expiryDate: expiryDate, calorie: calorie)
    }
    
    func isLowFat() -> Bool {
        return self.fatRate <= 30
    }
}
