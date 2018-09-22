//
//  Soda.swift
//  VendingMachine
//
//  Created by oingbong on 2018. 9. 20..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Soda: Beverage {
    private var sodium: Int // 나트륨함량 (mg)
    
    init(sodium:Int, brand:String, capacity:Int, price:Int, name:String, dateOfManufacture:Date, manufacturer:String) {
        self.sodium = sodium
        super.init(brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    public func isLowSodium() -> Bool {
        return self.sodium <= 100 ? true : false
    }
}

class Coke: Soda {
    private var calorie: Int // 칼로리 (kcal)
    
    init(dateOfManufacture : Date) {
        self.calorie = 90
        super.init(sodium: 200, brand: "펩시", capacity: 350, price: 1500, name: "다이어트콜라", dateOfManufacture: dateOfManufacture, manufacturer: "펩시")
    }
    
    init(calorie: Int, sodium:Int, brand:String, capacity:Int, price:Int, name:String, dateOfManufacture:Date, manufacturer:String) {
        self.calorie = calorie
        super.init(sodium: sodium, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    public func isLowCalorie() -> Bool {
        return self.calorie <= 100 ? true : false
    }
}

class Cider: Soda {
    private var transFat: Int // 트랜스지방 (g)
    
    init(dateOfManufacture : Date) {
        self.transFat = 0
        super.init(sodium: 300, brand: "칠성사이다", capacity: 140, price: 1100, name: "칠성사이다", dateOfManufacture: dateOfManufacture, manufacturer: "롯데칠성음료")
    }
    
    init(transFat: Int, sodium:Int, brand:String, capacity:Int, price:Int, name:String, dateOfManufacture:Date, manufacturer:String) {
        self.transFat = transFat
        super.init(sodium: sodium, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    public func isNoneTransFat() -> Bool {
        return self.transFat == 0 ? true : false
    }
}

enum FantaTaste {
    case orange
    case pineapple
    case grape
}

class Fanta: Soda {
    private var taste: FantaTaste // 색상 (pineapple , orange , grape , etc..)
    
    init(dateOfManufacture : Date) {
        self.taste = FantaTaste.orange
        super.init(sodium: 100, brand: "코카콜라", capacity: 355, price: 900, name: "오렌지맛환타", dateOfManufacture: dateOfManufacture, manufacturer: "코카콜라")
    }
    
    init(taste: FantaTaste, sodium:Int, brand:String, capacity:Int, price:Int, name:String, dateOfManufacture:Date, manufacturer:String) {
        self.taste = taste
        super.init(sodium: sodium, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    public func isOrangeTaste() -> Bool {
        return self.taste == FantaTaste.orange ? true :false
    }
}
