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
    
    init(name: String, volume: Int, brand: String, date: String, isZeroCalorie: Bool, fantaFlavor: FantaFlavor) {
        self.fantaFlavor = fantaFlavor
        super.init(name: name, volume: volume, price: 2000, brand: brand, date: date, isZeroCalorie: isZeroCalorie)
    }
    
    func isIncludeGrape() -> Bool {
        return fantaFlavor == .grape
    }
    
    func isIncludeOrange() -> Bool {
        return fantaFlavor == .orange
    }
    
    override func canBuyThisCoin(coin: Int) -> String? {
        if coin >= price { return "Fanta" }
        else { return nil }
    }
    
    override func searchDrinkNumber() -> Int {
        return 3
    }
}
