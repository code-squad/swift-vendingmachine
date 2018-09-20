//
//  Coffee.swift
//  VendingMachine
//
//  Created by oingbong on 2018. 9. 20..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private var caffeine: Int // 카페인함량 (mg)
    
    init(caffeine: Int, brand:String, capacity:Int, price:Int, name:String, dateOfManufacture:Date, manufacturer:String) {
        self.caffeine = caffeine
        super.init(brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
}
