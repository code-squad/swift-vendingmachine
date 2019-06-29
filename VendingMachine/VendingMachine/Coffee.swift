//
//  Coffee.swift
//  VendingMachine
//
//  Created by 김성현 on 25/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private var beverageTemperature: Int
    
    init(brand: String, packageSize: Int, price: Int, name: String, beverageTemperature: Int, dateOfManufacture: Date) {
        self.beverageTemperature = beverageTemperature
        super.init(brand: brand, packageSize: packageSize, price: price, name: name, dateOfManufacture: dateOfManufacture, expirationPeriod: Date.timeInterval(fromDays: 90))
    }
    
    var isHot: Bool {
        return beverageTemperature > 50
    }
}

class TOPCoffee: Coffee {
    init(dateOfManufacture: Date) {
        super.init(brand: "맥심", packageSize: 275, price: 1000, name: "TOP", beverageTemperature: 10, dateOfManufacture: dateOfManufacture)
    }
}

class CantataCoffee: Coffee {
    init(dateOfManufacture: Date) {
        super.init(brand: "롯데", packageSize: 500, price: 1500, name: "칸타타", beverageTemperature: 80, dateOfManufacture: dateOfManufacture)
    }
}
