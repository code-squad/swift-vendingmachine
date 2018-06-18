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
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedDate: String, caffeineContent: Double, flavor: String, temperature: Double) {
        self.flavor = flavor
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, caffeineContent: caffeineContent, temperature: temperature)
    }
    
    convenience init() {
        self.init(brand: "조지아", capacity: 150, price: ProductType.Georgia.price, name: "조지아커피", manufacturedDate: Date().today, caffeineContent: 20.5, flavor: "아메리카노", temperature: 27.5)
    }
}
