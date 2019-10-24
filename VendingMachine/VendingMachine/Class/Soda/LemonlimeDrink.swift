//
//  LemonlimeDrink.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/24.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class LemonlimeDrink: Soda {
    private let lemonScentContent: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, date: Date, sugarContent: Int, lemonScentContent: Bool) {
        self.lemonScentContent = lemonScentContent
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, date: date, sugarContent: sugarContent)
    }
}

