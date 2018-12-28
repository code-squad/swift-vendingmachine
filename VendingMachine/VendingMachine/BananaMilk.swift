//
//  BananaMilk.swift
//  VendingMachine
//
//  Created by 윤동민 on 28/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    var bananaJuiceAmount: Double
    
    init(name: String, volume: Int, price: Int, brand: String, date: String, fat: Bool, bananaAmount: Double) {
        self.bananaJuiceAmount = bananaAmount
        super.init(name: name, volume: volume, price: price, brand: brand, date: date, fat: fat)
    }
    
    func howMuchJuiceAmount() -> Double {
        return bananaJuiceAmount
    }
}
