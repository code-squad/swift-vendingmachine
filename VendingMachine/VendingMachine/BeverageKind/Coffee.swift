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
    init(_ kind:String, _ caffeine: Bool, _ temperature: Double, _ brand: String, _ volume: Int, _ price: Int, _ name: String, _ manufacturingDate: String) {
        self.kind = kind
        self.caffeine = caffeine
        self.temperature = temperature
        super.init(brand, volume, price, name, manufacturingDate)
    }
    
    func isHot() -> Bool {
        return temperature > 80
    }
    
    func isCaffeine() -> Bool {
        return caffeine
    }
    // 커피의 유통기한은 2일입니다.
    func validate(with: Date) -> Bool {
        return Date(timeInterval: 24 * 60 * 60 * 2, since: self.manufacturingDate) > Date(timeInterval: 9 * 60 * 60, since: with)
    }
}
