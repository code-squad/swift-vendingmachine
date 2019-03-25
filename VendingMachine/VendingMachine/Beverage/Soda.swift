//
//  Soda.swift
//  VendingMachine
//
//  Created by Elena on 25/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Soda: Beverage {
    
    // 오늘 날짜로 초기화
    init() {
        super.init(brand: "코카콜라", volume: 355, price: 1500, name: "코카콜라", manufacturedDate: Date())
    }
    
    // 날짜가 있다면 그 날자로 초기화
    init(day: Date) {
        super.init(brand: "코카콜라", volume: 355, price: 1500, name: "코카콜라", manufacturedDate: day)
        
    }
}
