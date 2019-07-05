//
//  BananaMilk.swift
//  VendingMachine
//
//  Created by hw on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

/// 수입원료에 대한 원산지 표기 추가
/// 바나나 함량 추가
class BananaMilk: Milk {
    private var bananaProportion: Double
    private (set) var origin: String
    
    init(brand: String, quantity: Int, price: Int, name: String, date: Date, isLowFat: Bool = false, bananaPercent: Double = 0.1, origin: String = "필리핀", farmCode: FarmCode? = nil) {
        self.bananaProportion = bananaPercent
        self.origin = origin
        
        super.init(brand: brand, quantity: quantity, price: price, name: name, date: date, isLowFat: isLowFat, farmCode: farmCode)
    }
}
