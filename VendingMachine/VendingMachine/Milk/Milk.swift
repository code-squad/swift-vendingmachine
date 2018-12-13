//
//  Milk.swift
//  VendingMachine
//
//  Created by 윤지영 on 11/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Milk: BeverageGroup {
    private let flavor: String?
    private let package: BeveragePackage
    private let useByDate: Double = 10
    private let expirationDate: Date

    init(brand: String, name: String, volume: Int, price: Int, dateOfManufacture: Date, flavor: String? = nil, package: BeveragePackage) {
        self.flavor = flavor
        self.package = package
        self.expirationDate = dateOfManufacture.addingDayInterval(useByDate)
        super.init(brand: brand, name: name, volume: volume, price: price, dateOfManufacture: dateOfManufacture)
    }

    convenience init(brand: String, name: String, volume: Int, price: Int, dateOfManufacture: Date, flavor: String? = nil) {
        self.init(
            brand: brand,
            name: name,
            volume: volume,
            price: price,
            dateOfManufacture: dateOfManufacture,
            flavor: flavor,
            package: BeveragePackage.paper)
    }

    override var group: BeverageCategory {
        return .milk
    }

    func hasFlavor() -> Bool {
        return flavor != nil
    }

    func validate(when date:Date) -> Bool {
        return date < expirationDate
    }

}
