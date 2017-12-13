//
//  Milk.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 12..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class Milk: Beverage, BeveragePorotocol {
    private let kind: String
    init(kind:String, brand: String, volume: Int, price: Int, name: String, manufacturingDate: String) {
        self.kind = kind
        super.init(brand, volume, price, name, manufacturingDate)
    }
    override var description: String {
        return "\(kind)우유 - " + super.description
    }
    
    // 유제품은 제조일로부터 7일이내에 드셔야합니다.
    func validate(with: Date) -> Bool {
        return Date(timeInterval: 24 * 60 * 60 * 7, since: self.manufacturingDate) > Date(timeInterval: 9 * 60 * 60, since: with)
    }
}
