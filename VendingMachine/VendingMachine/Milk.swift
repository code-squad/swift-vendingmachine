//
//  Milk.swift
//  VendingMachine
//
//  Created by Elena on 25/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    
    let chocolateMilk = Beverage.init(brand: "서울우유", volume: 250, price: 800, name: "초코우유", manufacturedDate: Date())
    
    // 오늘 날짜로 초기화
    init() {
        super.init(brand: "서울우유", volume: 250, price: 800, name: "초코우유", manufacturedDate: Date())
    }
    
    // 날짜가 있다면 그 날자로 초기화
    init(day: Date) {
        super.init(brand: "서울우유", volume: 250, price: 800, name: "초코우유", manufacturedDate: day)
        
    }
}
