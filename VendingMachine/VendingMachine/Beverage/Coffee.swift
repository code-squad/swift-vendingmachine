//
//  Coffee.swift
//  VendingMachine
//
//  Created by 김지나 on 04/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private let ice: Bool
    
    init(ice: Bool, brand: String, volume: Int, price: Int, productName: String, dateOfManufacture: Date = Date()) {
        self.ice = ice
        super.init(brand: brand, volume: volume, price: price, productName: productName, dateOfManufacture: dateOfManufacture, expirationDate: dateOfManufacture + 18144000)
    }
    
    func isHot() -> Bool {
        return ice == false
    }
}

class Kanu: Coffee {
    init() {
        super.init(ice: true, brand: "맥심", volume: 150, price: 1000, productName: "카누")
    }
}
class TOP: Coffee {
    init() {
        super.init(ice: false, brand: "맥심", volume: 100, price: 900, productName: "TOP")
    }
}
