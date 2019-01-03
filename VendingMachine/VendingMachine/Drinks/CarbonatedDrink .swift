//
//  CarbonatedDrink .swift
//  VendingMachine
//
//  Created by 윤동민 on 21/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class CarbonatedDrink: Beverage {
    var isZeroCalorie: Bool
    
    init(name: String, volume: Int, price: Int, brand: String, date: String, isZeroCalorie: Bool) {
        self.isZeroCalorie = isZeroCalorie
        super.init(name: name, volume: volume, price: price, brand: brand, date: date)
    }
    
    func isZeroCalorieDrink() -> Bool {
        return isZeroCalorie
    }
}
