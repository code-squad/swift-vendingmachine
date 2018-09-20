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
    
    public func isNoneCaffeine() -> Bool {
        return self.caffeine == 0 ? true : false
    }
}

class TOP: Coffee {
    private var hot: Bool // 뜨거움 여부
    
    init(hot: Bool, caffeine: Int, brand:String, capacity:Int, price:Int, name:String, dateOfManufacture:Date, manufacturer:String) {
        self.hot = hot
        super.init(caffeine: caffeine, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    public func isHot() -> Bool {
        return self.hot
    }
}

class Cantata: Coffee {
    private var sugarFree: Bool // 무가당여부
    
    init(sugarFree: Bool, caffeine: Int, brand:String, capacity:Int, price:Int, name:String, dateOfManufacture:Date, manufacturer:String) {
        self.sugarFree = sugarFree
        super.init(caffeine: caffeine, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    public func isSugarFree() -> Bool {
        return self.sugarFree
    }
}

class Georgia: Coffee {
    private var packageMaterial: String // 패키지재질 ( Can , Plastic , Glass , etc..)
    
    init(packageMaterial: String, caffeine: Int, brand:String, capacity:Int, price:Int, name:String, dateOfManufacture:Date, manufacturer:String) {
        self.packageMaterial = packageMaterial
        super.init(caffeine: caffeine, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    public func isCan() -> Bool {
        return self.packageMaterial == "Can" ? true : false
    }
}
