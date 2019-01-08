//
//  ChocoMilk.swift
//  VendingMachine
//
//  Created by 윤동민 on 28/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class ChocoMilk: Milk {
    private var cocoaPowderAmount: Double
    
    init(name: String, volume: Int, brand: String, date: String, fat: Bool, cocoaAmount: Double) {
        self.cocoaPowderAmount = cocoaAmount
        super.init(name: name, volume: volume, price: 1500, brand: brand, date: date, fat: fat)
    }
    
    func isHighPowderAmount() -> Bool {
        return cocoaPowderAmount > 1.0
    }
    
    override func convertToStringBeverage() -> String {
        return "\(type(of: self))"
    }
}
