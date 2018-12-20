//
//  Sprite.swift
//  VendingMachine
//
//  Created by 윤지영 on 13/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Sprite: SoftDrink {

    convenience init(volume: Int, price: Int, dateOfManufacture: Date, package: BeveragePackage) {
        let brand = "코카콜라컴퍼니"
        let name = "스프라이트"
        self.init(brand: brand, name: name, volume: volume, price: price, dateOfManufacture: dateOfManufacture, package: package)
    }

    convenience required init() {
        self.init(volume: 250, price: 1200, dateOfManufacture: Date.subtractingDaysFromNow(by: 30), package: .can)
    }

}
