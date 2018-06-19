//
//  ChocoMilk.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class ChocoMilk: Milk {
    
    private let hasCacao: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedDate: String, hasCacao: Bool) {
        self.hasCacao = hasCacao
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate)
    }
    
    convenience init() {
        self.init(brand: "서울우유", capacity: 250, price: 1300, name: "초코우유", manufacturedDate: Date().today, hasCacao: true)
    }
}
