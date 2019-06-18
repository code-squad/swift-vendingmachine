//
//  BananaMilk.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/18/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    let farmCode: Int
    
    init(brand: String, ml: Int, price: Int, productDate: String, farmCode: Int) {
        self.farmCode = farmCode
        
        super.init(brand: brand, ml: ml, price: price, name: "빙그레 바나나우유", productDate: productDate)
    }
}
