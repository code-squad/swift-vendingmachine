//
//  Milk.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 17..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private var lactose: Int
    init(lactose: Int, brand: String, size: Int, price: Int, name: String, openDate: Date) {
        self.lactose = lactose
        super.init(brand: brand, size: size, price: price, name: name, openDate: openDate)
    }
    
    func hasLactose() -> Bool {
        return self.lactose > 0
    }
}
