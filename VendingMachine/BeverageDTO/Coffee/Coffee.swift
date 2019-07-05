//
//  Coffee.swift
//  VendingMachine
//
//  Created by hw on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

/// 카페인 함량에 대한 프로퍼티 추가
class Coffee: Drink{
    private var coffeine: Double
    private let origin : CoffeeBean
    
    init(brand: String, quantity: Int, price: Int, name: String, date: Date, coffeine: Double = 100.0, origin: CoffeeBean = CoffeeBean.arabica) {
        self.coffeine = coffeine
        self.origin = origin
        super.init(brand: brand, quantity: quantity, price: price, name: name, date: date)
    }
}
