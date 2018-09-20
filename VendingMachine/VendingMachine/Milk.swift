//
//  Milk.swift
//  VendingMachine
//
//  Created by oingbong on 2018. 9. 20..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private var fat: Double // 지방함량 (%)
    
    init(fat:Double, brand:String, capacity:Int, price:Int, name:String, dateOfManufacture:Date, manufacturer:String) {
        self.fat = fat
        super.init(brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
}
