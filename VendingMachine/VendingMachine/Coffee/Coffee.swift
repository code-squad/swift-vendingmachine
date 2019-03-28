//
//  Coffee.swift
//  VendingMachine
//
//  Created by Elena on 25/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    
    private let caffeine: Int?
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedDate: Date, caffeine: Int? = nil) {
        self.caffeine = caffeine
        super.init(
            brand: brand,
            volume: volume,
            price: price,
            name: name,
            manufacturedDate: manufacturedDate)
    }
    
    // 카페인 함유량
    func isCaffeine(caffeine: Int?) -> Int{
        guard let caffeine = caffeine else {
            return -9
        }
        return caffeine
    }

    
}
