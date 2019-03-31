//
//  CantataCoffee.swift
//  VendingMachine
//
//  Created by Elena on 28/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class CantataCoffee: Coffee {
    
    private let coffeePackage: CoffeePackage
    
    init() {
        self.coffeePackage = .can
        super.init(brand: "롯데칠성음료", volume: 275, price: 2000, name: "칸타타 아메리카노", manufacturedDate: Date.changeString(beforeDate: "20170111"), caffeine: 40)
    }
    
    
}
