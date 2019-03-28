//
//  Soda.swift
//  VendingMachine
//
//  Created by Elena on 25/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Soda: Beverage {
    
    private let suger: Bool?
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedDate: Date, suger: Bool? = nil) {
        self.suger = suger
        super.init(
            brand: brand,
            volume: volume,
            price: price,
            name: name,
            manufacturedDate: manufacturedDate)
    }
    
    // 무가당 여부
    func isSuger() -> Bool {
        return suger != nil
    }
    
}
