//
//  StrawberryMilk.swift
//  VendingMachine
//
//  Created by hw on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

/// 딸기 함량 추가
class StrawberryMilk: Milk {
    private var strawberryProportion: Double
    
    init(brand: String, quantity: Int, price: Int, name: String, date: Date, fruitPercent: Double = 0.1 ) {
        self.strawberryProportion = fruitPercent
        super.init(brand: brand, quantity: quantity, price: price, name: name, date: date)
    }
}
