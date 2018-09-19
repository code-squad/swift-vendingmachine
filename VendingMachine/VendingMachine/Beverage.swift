//
//  Product.swift
//  VendingMachine
//
//  Created by oingbong on 2018. 9. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage : CustomStringConvertible {
    
    private var brand: String
    private var capacity: Int
    private var price: Int
    private var name: String
    private var dateOfManufacture: Date
    private var manufacturer: String
    
    init(brand:String, capacity:Int, price:Int, name:String, dateOfManufacture:Date, manufacturer:String) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.dateOfManufacture = dateOfManufacture
        self.manufacturer = manufacturer
    }
    
    var description: String {
        let date = convertDate(from: self.dateOfManufacture)
        return "\(self.manufacturer), \(self.capacity)ml, \(self.price)원, \(self.brand), \(date)"
    }
    
    func convertDate(from target: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyyMMdd"
        let date = dateFormatter.string(from: target)
        return date
    }
}

class Milk: Beverage {
    private var fat: Double // 지방함량 (%)
    
    init(fat:Double, brand:String, capacity:Int, price:Int, name:String, dateOfManufacture:Date, manufacturer:String) {
        self.fat = fat
        super.init(brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
}

class Soda: Beverage {
    private var sodium: Int // 나트륨함량 (mg)
    
    init(sodium:Int, brand:String, capacity:Int, price:Int, name:String, dateOfManufacture:Date, manufacturer:String) {
        self.sodium = sodium
        super.init(brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
}

class Coffee: Beverage {
    private var caffeine: Int // 카페인함량 (mg)
    
    init(caffeine: Int, brand:String, capacity:Int, price:Int, name:String, dateOfManufacture:Date, manufacturer:String) {
        self.caffeine = caffeine
        super.init(brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
}
