//
//  Coffee.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private let _isHot: Bool
    
    init(brand: String, volume: Int, price: Int, productName: String, expiryDate: Date, calorie: Int, isHot: Bool) {
        self._isHot = isHot
        super.init(brand: brand, volume: volume, price: price, productName: productName, expiryDate: expiryDate, calorie: calorie)
    }
    
    override var description: String {
        return "조지아커피(\(Georgia.bringTypeName)) - \(super.description)"
    }
    
    var isHot: Bool {
        return self._isHot
    }
}
