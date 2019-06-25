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
