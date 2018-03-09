//
//  Coke.swift
//  VendingMachine
//
//  Created by Choi Jeong Hoon on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation
class Coke: Soda {
    private var kindOfCoke: kindOfCoke = .original
    init(_ brand: String, _ weight: Int, _ price: Int, _ name: String, _ manufactured_date: String, _ amountOfSugar: Float, _ kindOfCoke: kindOfCoke) {
        self.kindOfCoke = kindOfCoke
        super.init(brand, weight, price, name, manufactured_date, amountOfSugar)
    }
   
}

enum kindOfCoke {
    case original, zero, light, cherry, lemon
}
