//
//  Coffee.swift
//  VendingMachine
//
//  Created by Elena on 25/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    
    // 오늘 날짜로 초기화
    init() {
        super.init(brand: "롯데칠성음료", volume: 275, price: 2000, name: "칸타타 아메리카노", manufacturedDate: Date())
    }
    
    // 날짜가 있다면 그 날자로 초기화
    init(day: Date) {
        super.init(brand: "롯데칠성음료", volume: 275, price: 2000, name: "칸타타 아메리카노", manufacturedDate: day)
        
    }
}
