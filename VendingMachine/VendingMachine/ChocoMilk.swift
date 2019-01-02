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
    
    init(name: String, volume: Int, price: Int, brand: String, date: String, fat: Bool, cocoaAmount: Double) {
        self.cocoaPowderAmount = cocoaAmount
        super.init(name: name, volume: volume, price: price, brand: brand, date: date, fat: fat)
    }
    
    func howMuchAmountCocoa() -> Double {
        return cocoaPowderAmount
    }
}
