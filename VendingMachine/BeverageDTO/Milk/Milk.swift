//
//  Milk.swift
//  VendingMachine
//
//  Created by hw on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

/// 저지방 유무에 대한 프로퍼티 추가
class Milk: Drink {
    private var isLowFat : Bool
    private (set) var farmCode : Int?
    
    init(brand: String, quantity: Int, price: Int, name: String, date: Date, isLowFat: Bool = true) {
        self.isLowFat = isLowFat
        super.init(brand: brand, quantity: quantity, price: price, name: name, date: date)
    }
    
    func hasFarmCode() -> Int? {
        guard let code = self.farmCode else{
            return -1
        }
        return code
    }
    
    func validate(with date:Date) -> Bool {
        let isValid = self.date < date ? true : false
        return isValid
    }
}
