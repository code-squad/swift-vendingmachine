//
//  Soda.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/21.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Soda: Beverage {
    private let isSugarFree: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, date: Date, isSugarFree: Bool = false) {
        self.isSugarFree = isSugarFree
        
        super.init(brand: brand, capacity: capacity, price: price, name: name, date: date)
    }
}
