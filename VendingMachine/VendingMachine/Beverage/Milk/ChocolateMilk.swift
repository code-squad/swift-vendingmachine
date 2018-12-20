//
//  ChocolateMilk.swift
//  VendingMachine
//
//  Created by 윤지영 on 13/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {

    convenience init(brand: String, name: String, volume: Int, price: Int, dateOfManufacture: Date) {
        let flavor = "초코"
        self.init(brand: brand, name: name, volume: volume, price: price, dateOfManufacture: dateOfManufacture, flavor: flavor)
    }

    convenience init(brand: String, name: String, volume: Int, price: Int, dateOfManufacture: Date, package: BeveragePackage) {
        let flavor = "초코"
        self.init(brand: brand, name: name, volume: volume, price: price, dateOfManufacture: dateOfManufacture, flavor: flavor, package: package)
    }

    convenience required init() {
        self.init(brand: "푸르밀", name: "가나 초코우유", volume: 300, price: 1200, dateOfManufacture: Date.subtractingDaysFromNow(by: 3))
    }

}
