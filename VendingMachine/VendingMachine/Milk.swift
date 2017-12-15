//
//  Milk.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 12..
//  Copyright © 2017년 Napster. All rights reserved.
//


import Foundation

class Milk: Beverage, BeveragePorotocol {
    private (set) var kind: String
    private let fatContent: Double
    init(kind:String, fatContent: Double, brand: String, volume: Int, price: Int, name: String, manufacturingDate: String) {
        self.kind = kind
        self.fatContent = fatContent
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturingDate: manufacturingDate)
    }
    
    func isLowFat() -> Bool {
        return fatContent <= 1.5
    }
    
    // 유제품은 제조일로부터 7일이내에 드셔야합니다.
    func validate(with: Date) -> Bool {
        return Date(timeInterval: DateInterval.oneWeek.rawValue, since: self.manufacturingDate) > Date(timeInterval: DateInterval.today.rawValue, since: with)
    }
}
