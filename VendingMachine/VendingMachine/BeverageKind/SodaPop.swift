//
//  SodaPop.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 12..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class SodaPop: Beverage, BeveragePorotocol {
    private (set) var kind: String
    private let sugarContent: Double
    init(_ kind:String, _ sugarContent: Double , _ brand: String, _ volume: Int, _ price: Int, _ name: String, _ manufacturingDate: String) {
        self.kind = kind
        self.sugarContent = sugarContent
        super.init(brand, volume, price, name, manufacturingDate)
    }

    func isHighSugar() -> Bool {
        return sugarContent > 5
    }
    
    // 탄산음료의 유통기한은 제조일로부터 1년입니다.
    func validate(with: Date) -> Bool {
        return Date(timeInterval: 24 * 60 * 60 * 365, since: self.manufacturingDate) > Date(timeInterval: 9 * 60 * 60, since: with)
    }
}
