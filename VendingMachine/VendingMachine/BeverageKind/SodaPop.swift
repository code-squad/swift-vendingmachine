//
//  SodaPop.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 12..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class SodaPop: Beverage, BeveragePorotocol {
    private let kind: String
    init(kind:String, brand: String, volume: Int, price: Int, name: String, manufacturingDate: String) {
        self.kind = kind
        super.init(brand, volume, price, name, manufacturingDate)
    }
    override var description: String {
        return "\(kind) - " + super.description
    }
    
    // 탄산음료의 유통기한은 제조일로부터 1년입니다.
    func validate(with: Date) -> Bool {
        return Date(timeInterval: 24 * 60 * 60 * 365, since: self.manufacturingDate) > Date(timeInterval: 9 * 60 * 60, since: with)
    }
}
