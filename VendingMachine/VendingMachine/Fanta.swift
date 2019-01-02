//
//  Cider.swift
//  VendingMachine
//
//  Created by 윤동민 on 28/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation
enum FantaFlavor {
    case grape
    case orange
}

class Fanta: CarbonatedDrink {
    private var fantaFlavor: FantaFlavor
    
    init(name: String, volume: Int, price: Int, brand: String, date: String, isZeroCalorie: Bool, fantaFlavor: FantaFlavor) {
        self.fantaFlavor = fantaFlavor
        super.init(name: name, volume: volume, price: price, brand: brand, date: date, isZeroCalorie: isZeroCalorie)
    }
    
    func isIncludeGrape() -> Bool {
        guard fantaFlavor == .grape { return false }
        return true
    }
    
    func isIncludeOrange() -> Bool {
        guard fantaFlavor == .orange { return false }
        return true
    }
}
