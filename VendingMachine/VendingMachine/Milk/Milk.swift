//
//  Milk.swift
//  VendingMachine
//
//  Created by Elena on 25/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private let hot: Bool
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedDate: Date, hot: Bool = true) {
        self.hot = hot
        super.init(
            brand: brand,
            volume: volume,
            price: price,
            name: name,
            manufacturedDate: manufacturedDate)
    }
    
    // 뜨거운 여부
    func isHot() -> Bool {
        return !hot
    }
}


