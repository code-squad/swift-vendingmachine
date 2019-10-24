//
//  ChocolateMilk.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/24.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class ChocolateMilk: Milk {
    private let chocolateContent: Int
    
    init(brand: String, capacity: Int, price: Int, name: String, date: Date, fatContent: Double, chocolateContent: Int) {
        self.chocolateContent = chocolateContent
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, date: date, fatContent: fatContent)
    }
}
