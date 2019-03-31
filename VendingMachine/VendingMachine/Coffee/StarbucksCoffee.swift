//
//  StarbucksCoffee.swift
//  VendingMachine
//
//  Created by Elena on 28/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class StarbucksCoffee: Coffee {
    
    private let coffeePackage: CoffeePackage
    
    init() {
        self.coffeePackage = .glass
        super.init(brand: "동서식품", volume: 281, price: 3000, name: "스타벅스 모카", manufacturedDate:Date.changeString(beforeDate: "20180915"), caffeine: 30)
    }
    
    
}
