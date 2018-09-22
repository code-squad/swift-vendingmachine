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
    
    init(dateOfManufacture : Date) {
        self.flavor = Flavor.light
        super.init(fat: 0.2, brand: "매일우유", capacity: 125, price: 1200, name: "유기농딸기우유", dateOfManufacture: dateOfManufacture, manufacturer: "매일우유")
    }
    
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
    
    init(dateOfManufacture : Date) {
        self.concentration = 0.1
        super.init(fat: 0.7, brand: "서울우유", capacity: 200, price: 900, name: "서울초코우유", dateOfManufacture: dateOfManufacture, manufacturer: "서울우유")
    }
    
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
    
    init(dateOfManufacture : Date) {
        self.color = BananaMilkColor.white
        super.init(fat: 0.4, brand: "매일우유", capacity: 240, price: 1500, name: "바나나는원래하얗다", dateOfManufacture: dateOfManufacture, manufacturer: "매일우유")
    }
    
    init(color: BananaMilkColor, fat: Double, brand: String, capacity: Int, price: Int, name: String, dateOfManufacture: Date, manufacturer: String) {
        self.color = color
        super.init(fat: fat, brand: brand, capacity: capacity, price: price, name: name, dateOfManufacture: dateOfManufacture, manufacturer: manufacturer)
    }
    
    public func isWhiteColor() -> Bool {
        return self.color == BananaMilkColor.white ? true : false
    }
}
