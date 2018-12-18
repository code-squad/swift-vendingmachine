//
//  Milk.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 17..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private var hasLactose: Bool
    init(hasLactose:Bool, brand: String, size: Int, price: Int, name: String, openDate: Date) {
        self.hasLactose = hasLactose
        super.init(brand: brand, size: size, price: price, name: name, openDate: openDate)
    }
}
