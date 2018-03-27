//
//  Coke.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
class Coke: Soda {
    private var kindOfCoke: KindOfCoke = .original
    init(_ brand: String,
         _ weight: Int,
         _ price: Int,
         _ name: String,
         _ manufacturedDate: String,
         _ amountOfSugar: Float,
         _ kindOfCoke: KindOfCoke) {
        self.kindOfCoke = kindOfCoke
        super.init(brand, weight, price, name, manufacturedDate, amountOfSugar)
    }
}

enum KindOfCoke {
    case original, zero, light, cherry, lemon
}
