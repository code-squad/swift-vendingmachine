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
    
    init(transFat: Int, sodium:Int, brand:String, capacity:Int, price:Int, name:String, dateOfManufacture:Date, manufacturer:String) {
        self.transFat = transFat
        super.init(sodium: sodium, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    public func isNoneTransFat() -> Bool {
        return self.transFat == 0 ? true : false
    }
}

class Fanta: Soda {
    private var taste: String // 색상 (pineapple , orange , grape , etc..)
    
    init(taste: String, sodium:Int, brand:String, capacity:Int, price:Int, name:String, dateOfManufacture:Date, manufacturer:String) {
        self.taste = taste
        super.init(sodium: sodium, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    public func isOrangeTaste() -> Bool {
        return self.taste == "orange" ? true :false
    }
}
