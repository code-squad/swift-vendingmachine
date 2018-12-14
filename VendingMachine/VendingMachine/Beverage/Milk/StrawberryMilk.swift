//
//  StrawberryMilk.swift
//  VendingMachine
//
//  Created by 윤지영 on 13/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {

    convenience init(brand: String, name: String, volume: Int, price: Int, dateOfManufacture: Date) {
        let flavor = "딸기"
        self.init(brand: brand, name: name, volume: volume, price: price, dateOfManufacture: dateOfManufacture, flavor: flavor)
    }

    convenience init(brand: String, name: String, volume: Int, price: Int, dateOfManufacture: Date, package: BeveragePackage) {
        let flavor = "딸기"
        self.init(brand: brand, name: name, volume: volume, price: price, dateOfManufacture: dateOfManufacture, flavor: flavor, package: package)
    }

    convenience init() {
        self.init(brand: "서울우유", name: "언니몰래먹는딸기우유", volume: 200, price: 2000, dateOfManufacture: Date.subtractingDaysFromNow(by: 3))
    }

}
