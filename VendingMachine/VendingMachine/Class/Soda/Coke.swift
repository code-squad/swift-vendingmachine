//
//  Coke.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/24.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coke: Soda {
    private let caffeineContent: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, date: Date, sugarContent: Int, caffeineContent: Bool) {
        self.caffeineContent = caffeineContent
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, date: date, sugarContent: sugarContent)
    }
}

