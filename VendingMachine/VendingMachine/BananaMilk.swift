//
//  BananaMilk.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/18/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    
    
    init(brand: String, ml: Int, price: Int, productDate: String, farmCode: Int, expirationDate: String) {
        super.init(brand: brand, ml: ml, price: price, productDate: productDate, name: "빙그레 바나나우유", farmCode: farmCode, barcode: Barcode.upc(50, 150, 40, 30), expirationDate: expirationDate)
    }
}
