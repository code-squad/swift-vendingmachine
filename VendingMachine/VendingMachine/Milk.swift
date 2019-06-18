//
//  Milk.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/18/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Milk: Drink {
    let farmCode: Int
    
    init(brand: String, ml: Int, price: Int, productDate: String, name: String, farmCode: Int) {
        self.farmCode = farmCode
        
        super.init(brand: brand, ml: ml, price: price, name: name, productDate: productDate)
    }
}
