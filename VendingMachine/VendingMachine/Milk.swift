//
//  Milk.swift
//  VendingMachine
//
//  Created by CHOMINJI on 12/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    override init(brand: String, capacity: Int, price: Int, name: String, dateOfManufactured: Date) {
        super.init(brand: brand, capacity: capacity, price: price, name: name, dateOfManufactured: dateOfManufactured)
    }
}
