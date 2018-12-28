//
//  Coffee.swift
//  VendingMachine
//
//  Created by 윤동민 on 21/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    var caffeineAmount: Int
    
    init(name: String, volume: Int, price: Int, brand: String, date: String, caffeineAmount: Int) {
        self.caffeineAmount = caffeineAmount
        super.init(name: name, volume: volume, price: price, brand: brand, date: date)
    }
}
