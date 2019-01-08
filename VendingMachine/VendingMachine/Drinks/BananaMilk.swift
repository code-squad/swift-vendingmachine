//
//  BananaMilk.swift
//  VendingMachine
//
//  Created by 윤동민 on 28/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    private var bananaJuiceAmount: Double
    
    init(name: String, volume: Int, brand: String, date: String, fat: Bool, bananaAmount: Double) {
        self.bananaJuiceAmount = bananaAmount
        super.init(name: name, volume: volume, price: 1500, brand: brand, date: date, fat: fat)
    }
    
    func isHighJuiceAmount() -> Bool {
        return bananaJuiceAmount > 1.0
    }
    
//    override func getTypeWhatCanBuy(coin: Coin) -> String? {
//        if coin.isEnoughToBuy(of: self.price) { return convertToStringBeverage() }
//        else { return nil }
//    }
    
    override func searchDrinkNumber() -> Int {
        return 1
    }
    
    override func convertToStringBeverage() -> String {
        return "\(type(of: self))"
    }
}
