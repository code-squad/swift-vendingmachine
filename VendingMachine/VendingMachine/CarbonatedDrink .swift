//
//  CarbonatedDrink .swift
//  VendingMachine
//
//  Created by 윤동민 on 21/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum CarbonatedDrinkKind {
    case cola
    case cider
    case fanta
}

class CarbonatedDrink: Beverage {
    var kind: CarbonatedDrinkKind
    
    init(name: String, volume: Int, price: Int, brand: String, date: String, drinkKind: CarbonatedDrinkKind) {
        self.kind = drinkKind
        super.init(name: name, volume: volume, price: price, brand: brand, date: date)
    }
}
