//
//  Cantata.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Cantata: Coffee {
    private let flavor: String
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedDate: String, caffeineContent: Double, flavor: String, temperature: Double) {
        self.flavor = flavor
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, caffeineContent: caffeineContent, temperature: temperature)
    }
    
    convenience required init() {
        self.init(brand: "칸타타", capacity: 180, price: 1200, name: "칸타타커피", manufacturedDate: Date().today, caffeineContent: 35.5, flavor: "라떼", temperature: 27.5)
    }
}
