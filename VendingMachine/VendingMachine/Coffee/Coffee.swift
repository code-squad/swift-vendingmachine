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

    func same(_ number: Int) -> Bool {
        return self.caffeine == number
    }
    
}
