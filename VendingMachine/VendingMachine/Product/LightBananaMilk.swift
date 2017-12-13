//
//  lowFatBananMilk.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 13..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class LightBananaMilk: Milk {
    private let fatContent = 1.5 // %
    private let bottleCapColor = "BLUE"
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturingDate: String) {
        super.init(kind: "바나나", brand: brand, volume: volume, price: price, name: name, manufacturingDate: manufacturingDate)
    }
    
    func isLowFact() -> Bool {
        return fatContent < 2
    }
    
    func hasBlueCap() -> Bool {
        return bottleCapColor == "BLUE"
    }
}
