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
    
    init(name: String, volume: Int, brand: String, date: String, isZeroCalorie: Bool, sugarAmount: Double) {
        self.sugarAmount = sugarAmount
        super.init(name: name, volume: volume, price: 2000, brand: brand, date: date, isZeroCalorie: isZeroCalorie)
    }
    
    func isHighSugarAmount() -> Bool {
        return sugarAmount > 1.0
    }
    
    override func canBuyThisCoin(coin: Coin) -> String? {
        if coin.isEnoughToBuy(of: self.price) { return "Cola" }
        else { return nil }
    }
    
    override func searchDrinkNumber() -> Int {
        return 4
    }
    
    override func convertToStringBeverage() -> String {
        return "Cola"
    }
}
