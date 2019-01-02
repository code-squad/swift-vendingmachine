//
//  Cola.swift
//  VendingMachine
//
//  Created by 윤동민 on 28/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Cola: CarbonatedDrink {
    private var sugarAmount: Double
    
    init(name: String, volume: Int, price: Int, brand: String, date: String, isZeroCalorie: Bool, sugarAmount: Double) {
        self.sugarAmount = sugarAmount
        super.init(name: name, volume: volume, price: price, brand: brand, date: date, isZeroCalorie: isZeroCalorie)
    }
    
    func howMuchSugarAmount() -> Double {
        return sugarAmount
    }
}
