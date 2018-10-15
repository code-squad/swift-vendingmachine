//
//  Coffee.swift
//  VendingMachine
//
//  Created by 이동건 on 15/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    private var caffeine: Double // 카페인 함량
    
    init(caffeine: Double, brand: String, volume: Int, price: Int, name: String, date: Date, expire: Date) {
        self.caffeine = caffeine
        super.init(brand: brand, volume: volume, price: price, name: name, date: date, expire: expire)
    }
}

class Latte: Coffee {
    private var milk: Double
    private var art: Art
    
    enum Art {
        case flower
        case heart
        case none
    }
    
    init(milk: Double, art: Art, caffeine: Double, code: String, brand: String, volume: Int, price: Int, name: String, date: Date, expire: Date) {
        self.milk = milk
        self.art = art
        super.init(caffeine: caffeine, brand: brand, volume: volume, price: price, name: name, date: date, expire: expire)
    }
}

class Affogato: Coffee {
    private var iceCream: Flavor // 아이스크림 종류
    
    enum Flavor {
        case vanilla
        case chocolate
        case caramel
    }
    
    init(iceCream: Flavor, caffeine: Double, code: String, brand: String, volume: Int, price: Int, name: String, date: Date, expire: Date) {
        self.iceCream = iceCream
        super.init(caffeine: caffeine, brand: brand, volume: volume, price: price, name: name, date: date, expire: expire)
    }
}
