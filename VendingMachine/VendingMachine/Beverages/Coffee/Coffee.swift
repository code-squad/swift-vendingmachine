//
//  Coffee.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private let temperature: Int
    
    init(brand: String, volume: Int, price: Int, productName: String, expiryDate: Date, calorie: Int, temperature: Int) {
        self.temperature = temperature
        super.init(brand: brand, volume: volume, price: price, productName: productName, expiryDate: expiryDate, calorie: calorie)
    }
    
    func isHot() -> Bool {
        return self.temperature > 50
    }
}
