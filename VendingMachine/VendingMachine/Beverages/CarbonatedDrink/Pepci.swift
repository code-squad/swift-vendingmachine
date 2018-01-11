//
//  Pecci.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Pepci: CarbonatedDrink {
    override init(brand: String, volume: Int, price: Int, productName: String, expiryDate: Date, calorie: Int, carbonicAcid: String) {
        super.init(brand: brand, volume: volume, price: price, productName: productName, expiryDate: expiryDate, calorie: calorie, carbonicAcid: carbonicAcid)
    }
    
    override var description: String {
        return "펩시(\(Pepci.typeName)) - \(super.description)"
    }
}
