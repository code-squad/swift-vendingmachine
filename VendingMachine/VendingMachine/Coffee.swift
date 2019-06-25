//
//  Coffee.swift
//  VendingMachine
//
//  Created by 김성현 on 25/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private(set) var isHot: Bool
    
    init(brand: String, packageSize: Int, price: Int, name: String, isHot: Bool, dateOfManufacture: Date) {
        self.isHot = isHot
        super.init(brand: brand, packageSize: packageSize, price: price, name: name, dateOfManufacture: dateOfManufacture)
    }
}

class TOPCoffee: Coffee {
    init(dateOfManufacture: Date) {
        super.init(brand: "맥심", packageSize: 275, price: 1000, name: "TOP", isHot: false, dateOfManufacture: dateOfManufacture)
    }
}

class CantataCoffee: Coffee {
    init(dateOfManufacture: Date) {
        super.init(brand: "롯데", packageSize: 500, price: 1500, name: "칸타타", isHot: true, dateOfManufacture: dateOfManufacture)
    }
}
