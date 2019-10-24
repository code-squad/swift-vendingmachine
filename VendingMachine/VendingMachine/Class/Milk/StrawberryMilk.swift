//
//  StrawberryMilk.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/24.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    private let strawberryContent: Int
    
    init(brand: String, capacity: Int, price: Int, name: String, date: Date, fatContent: Double, strawberryContent: Int) {
        self.strawberryContent = strawberryContent
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, date: date, fatContent: fatContent)
    }
}
