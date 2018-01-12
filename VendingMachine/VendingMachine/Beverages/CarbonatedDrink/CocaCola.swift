//
//  CokaCola.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class CocaCola: CarbonatedDrink {
    private let _packageMaterial: String
    
    init(brand: String, volume: Int, price: Int, productName: String, expiryDate: Date, calorie: Int, carbonicAcid: Int, packageMaterial: String) {
        self._packageMaterial = packageMaterial
        super.init(brand: brand, volume: volume, price: price, productName: productName, expiryDate: expiryDate, calorie: calorie, carbonicAcid: carbonicAcid)
    }
    
    var packageMaterial: String {
        return self._packageMaterial
    }
    
    override var description: String {
        return "코카콜라(\(CocaCola.typeName)) - \(super.description)"
    }
}
