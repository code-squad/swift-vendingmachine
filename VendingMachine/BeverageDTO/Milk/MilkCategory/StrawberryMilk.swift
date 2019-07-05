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
    private let strawberryProportion: Double
    private let fruitOrigin: String
    
    init(brand: String, quantity: Int, price: Int, name: String, date: Date, isLowFat: Bool = false,  fruitPercent: Double = 0.1, origin: String = "국산", farmCode: FarmCode? = nil ) {
        self.strawberryProportion = fruitPercent
        self.fruitOrigin = origin
        
        super.init(brand: brand, quantity: quantity, price: price, name: name, date: date, isLowFat: isLowFat, farmCode: farmCode)
    }
}
