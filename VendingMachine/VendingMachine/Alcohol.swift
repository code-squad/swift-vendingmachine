//
//  Alcohol.swift
//  VendingMachine
//
//  Created by 이동건 on 15/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Alcohol: Beverage {
    private var alcohol: Double // 알코올 도수
    
    init(alcohol: Double, brand: String, volume: Int, price: Int, name: String, date: Date, expire: Date) {
        self.alcohol = alcohol
        super.init(brand: brand, volume: volume, price: price, name: name, date: date, expire: expire)
    }
}

class Beer: Alcohol {
    private var malt: Double // 맥아 비율
    
    init(malt: Double, alcohol: Double, brand: String, volume: Int, price: Int, name: String, date: Date, expire: Date) {
        self.malt = malt
        super.init(alcohol: alcohol, brand: brand, volume: volume, price: price, name: name, date: date, expire: expire)
    }
}

class Wine: Alcohol {
    private var aging: Int // 숙성 기간
    private var type : Type
    
    enum `Type` {
        case white
        case red
        case sparkling
    }
    
    init(aging: Int, type: Type, alcohol: Double, brand: String, volume: Int, price: Int, name: String, date: Date, expire: Date) {
        self.aging = aging
        self.type = type
        super.init(alcohol: alcohol, brand: brand, volume: volume, price: price, name: name, date: date, expire: expire)
    }
}
