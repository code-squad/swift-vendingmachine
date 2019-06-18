//
//  StrawberryMilk.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/18/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    init(brand: String, ml: Int, price: Int, productDate: String, farmCode: Int) {
        super.init(brand: brand, ml: ml, price: price, productDate: productDate, name: "빙그레 딸기우유", farmCode: farmCode)
    }
}
