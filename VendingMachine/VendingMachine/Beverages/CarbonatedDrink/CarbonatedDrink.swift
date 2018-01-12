//
//  CarbonatedDrink.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class CarbonatedDrink: Beverage {
    private let carbonicAcid: Int

    init(brand: String, volume: Int, price: Int, productName: String, expiryDate: Date, calorie: Int, carbonicAcid: Int) {
        self.carbonicAcid = carbonicAcid
        super.init(brand: brand, volume: volume, price: price, productName: productName, expiryDate: expiryDate, calorie: calorie)
    }
}
