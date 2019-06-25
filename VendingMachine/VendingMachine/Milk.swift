//
//  Milk.swift
//  VendingMachine
//
//  Created by 김성현 on 25/06/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    var milkFactoryIdentifier: String
    
    init(brand: String, packageSize: Int, price: Int, name: String, milkFactoryIdentifier: String, dateOfManufacture: Date) {
        self.milkFactoryIdentifier = milkFactoryIdentifier
        super.init(brand: brand, packageSize: packageSize, price: price, name: name, dateOfManufacture: dateOfManufacture)
    }
}

class StrawberryMilk: Milk {
    <#code#>
}

class ChocolateMilk: Milk {
    <#code#>
}
