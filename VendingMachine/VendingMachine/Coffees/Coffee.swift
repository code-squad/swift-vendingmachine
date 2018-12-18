//
//  Coffee.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 17..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private let caffeine: Int
    let isHot: Bool
    
    init(caffeine: Int, isHot: Bool, brand: String, size: Int, price: Int, name: String, openDate: Date) {
        self.caffeine = caffeine
        self.isHot = isHot
        super.init(brand: brand, size: size, price: price, name: name, openDate: openDate)
    }
}
