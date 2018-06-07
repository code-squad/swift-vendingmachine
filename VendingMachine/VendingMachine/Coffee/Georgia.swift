//
//  Georgia.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Georgia: Coffee {
    private let flavor: String
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedDate: String, caffeineContent: Double, flavor: String) {
        self.flavor = flavor
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, caffeineContent: caffeineContent)
    }
}
