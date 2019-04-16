//
//  Soda.swift
//  VendingMachine
//
//  Created by Elena on 25/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Soda: Beverage {
    
    private let suger: Bool
    static let expiredays: Int = 365
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedDate: Date,suger: Bool , expiryPeriod: Int = Soda.expiredays) {
        self.suger = suger
        super.init(
            brand: brand,
            volume: volume,
            price: price,
            name: name,
            manufacturedDate: manufacturedDate,
            expiryPeriod: expiryPeriod )
    }
    
    // 무가당 여부
    func isSuger() -> Bool {
        if suger == true { return true }
        return false
    }

}
