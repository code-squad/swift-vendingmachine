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
    init(_ kind:String, _ fatContent: Double, _ brand: String, _ volume: Int, _ price: Int, _ name: String, _ manufacturingDate: String) {
        self.kind = kind
        self.fatContent = fatContent
        super.init(brand, volume, price, name, manufacturingDate)
    }
    
    func isLowFat() -> Bool {
        return fatContent <= 1.5
    }
    
    // 유제품은 제조일로부터 7일이내에 드셔야합니다.
    func validate(with: Date) -> Bool {
        return Date(timeInterval: 24 * 60 * 60 * 7, since: self.manufacturingDate) > Date(timeInterval: 9 * 60 * 60, since: with)
    }
}
