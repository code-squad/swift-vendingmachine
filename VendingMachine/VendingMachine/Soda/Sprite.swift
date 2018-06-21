//
//  Sprite.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 7..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Sprite: Soda {
    
    private let hasOneMoreOnCap: Bool // 뚜껑에 한 병 더
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedDate: String, calories: Int, hasOneMoreOnCap: Bool) {
        self.hasOneMoreOnCap = hasOneMoreOnCap
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, calories: calories)
    }
    
    convenience required init() {
        self.init(brand: "사이다", capacity: 200, price: 1000, name: "코카콜라", manufacturedDate: Date().today, calories: 35, hasOneMoreOnCap: false)
    }
}
