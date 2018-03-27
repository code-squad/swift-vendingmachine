//
//  Top.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
class Top: Coffee {
    private let productFamily: TopProductFamily
    init(_ brand: String,
         _ weight: Int,
         _ price: Int,
         _ name: String,
         _ manufacturedDate: String,
         _ sizeType: CoffeeSize,
         _ productFamily: TopProductFamily) {
        self.productFamily = productFamily
        super.init(brand, weight, price, name, manufacturedDate, sizeType)
    }
}

enum TopProductFamily {
    case basic, coldbrew, simplieSmooth
}
