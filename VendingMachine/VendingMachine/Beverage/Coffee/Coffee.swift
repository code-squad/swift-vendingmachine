//
//  Coffee.swift
//  VendingMachine
//
//  Created by 윤지영 on 11/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Coffee: BeverageGroup {
    private let ice: Bool

    init(brand: String, name: String, volume: Int, price: Int, dateOfManufacture: Date, ice: Bool) {
        self.ice = ice
        super.init(brand: brand, name: name, volume: volume, price: price, dateOfManufacture: dateOfManufacture)
    }

    override var group: BeverageCategory {
        return .coffee
    }

    func isHot() -> Bool {
        return !ice
    }
}
