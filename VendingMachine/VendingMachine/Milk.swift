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
    
    public func isLowFat() -> Bool {
        return self.fat <= 0.3 ? true : false
    }
}

enum Flavor {
    case strong
    case light
    case none
}

class StrawberryMilk: Milk {
    private var flavor: Flavor // 향 (풍미)
    
    init(flavor:Flavor, fat: Double, brand: String, capacity: Int, price: Int, name: String, dateOfManufacture: Date, manufacturer: String) {
        self.flavor = flavor
        super.init(fat: fat, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    public func isNoneFlavor() -> Bool {
        return self.flavor == Flavor.none ? true : false
    }
}

class ChocolateMilk: Milk {
    private var concentration: Double // 농도 (%)
    
    init(concentration: Double, fat: Double, brand: String, capacity: Int, price: Int, name: String, dateOfManufacture: Date, manufacturer: String) {
        self.concentration = concentration
        super.init(fat: fat, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    public func isLowConcentration() -> Bool {
        return self.concentration <= 0.3 ? true : false
    }
}

enum BananaMilkColor {
    case white
    case yellow
}

class BananaMilk: Milk {
    private var color: BananaMilkColor // 색상 (yellow , light yellow , white , etc..)
    init(color: BananaMilkColor, fat: Double, brand: String, capacity: Int, price: Int, name: String, dateOfManufacture: Date, manufacturer: String) {
        self.color = color
        super.init(fat: fat, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    public func isWhiteColor() -> Bool {
        return self.color == BananaMilkColor.white ? true : false
    }
}
