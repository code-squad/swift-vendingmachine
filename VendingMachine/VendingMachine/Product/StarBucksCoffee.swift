//
//  StarBucksCoffee.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 13..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class StarBucksCoffee: Coffee, BeveragePorotocol {
    private var caffeine: Bool
    init(volume: Int, price: Int, manufacturingDate: String, caffeine: Bool) {
        self.caffeine = caffeine
        super.init(kind: "커피", brand: "스타벅스", volume: 500, price: 5600, name: "스타벅스 아메리카노", manufacturingDate: "20171213")
    }
    
    func hasCaffeine() -> Bool {
        return caffeine
    }
    
    // 아메리카노의 유통기한은 2일입니다.
    func validate(with: Date) -> Bool {
        return Date(timeInterval: 24 * 60 * 60 * 2, since: self.manufacturingDate) > Date(timeInterval: 9 * 60 * 60, since: with)
    }
}
