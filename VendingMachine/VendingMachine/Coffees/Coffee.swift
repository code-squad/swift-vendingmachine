//
//  Coffee.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 17..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage, VariousTemperatures {
    let hasMilk: Bool
    var isHot: Bool
    
    init(hasMilk: Bool, isHot: Bool, brand: String, size: Int, price: Int, name: String, openDate: Date, expiryDate: Int) {
        self.hasMilk = hasMilk
        self.isHot = isHot
        super.init(brand: brand, size: size, price: price, name: name, openDate: openDate, expiryDate: expiryDate)
    }
}
