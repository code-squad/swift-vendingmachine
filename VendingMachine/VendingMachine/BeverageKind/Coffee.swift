//
//  Coffee.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 12..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class Coffee: Beverage, BeveragePorotocol {
    private (set) var kind: String
    private let caffeine: Bool
    private let temperature: Double
    init(kind:String, caffeine: Bool, temperature: Double, brand: String, volume: Int, price: Int, name: String, manufacturingDate: String) {
        self.kind = kind
        self.caffeine = caffeine
        self.temperature = temperature
        super.init(brand: brand, volume: volume, price: price, name: name, manufacturingDate: manufacturingDate)
    }
    
    func isHot() -> Bool {
        return temperature > 80
    }
    
    func isCaffeine() -> Bool {
        return caffeine
    }
    // 커피의 유통기한은 2일입니다.
    func validate(with: Date) -> Bool {
        return Date(timeInterval: DateInterval.twoDays.rawValue, since: self.manufacturingDate) > Date(timeInterval: DateInterval.today.rawValue, since: with)
    }
}
