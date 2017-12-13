//
//  RealBananaMilk.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 13..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class RealBananaMilk: Milk {
    private let bananMilkColor = "WHITE"
    init(brand: String, volume: Int, price: Int, name: String, manufacturingDate: String) {
        super.init(kind: "바나나", brand: brand, volume: volume, price: price, name: name, manufacturingDate: manufacturingDate)
    }
    
    func isRealBanana() -> Bool {
        return bananMilkColor == "WHITE"
    }
}
