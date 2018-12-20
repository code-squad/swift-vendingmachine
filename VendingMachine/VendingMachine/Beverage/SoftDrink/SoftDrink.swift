//
//  SoftDrink.swift
//  VendingMachine
//
//  Created by 윤지영 on 11/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class SoftDrink: BeverageGroup {
    private let package: BeveragePackage

    init(brand: String, name: String, volume: Int, price: Int, dateOfManufacture: Date, package: BeveragePackage) {
        self.package = package
        super.init(brand: brand, name: name, volume: volume, price: price, dateOfManufacture: dateOfManufacture)
    }

    convenience required init() {
        self.init(
            brand: "코카콜라컴퍼니",
            name: "코카콜라",
            volume: 500,
            price: 1700,
            dateOfManufacture: Date.subtractingDaysFromNow(by: 20),
            package: .plastic)
    }

    override var group: BeverageCategory {
        return .softDrink
    }

}
