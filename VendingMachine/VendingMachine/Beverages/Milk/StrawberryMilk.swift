//
//  Strawberry.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    private let _smell: String
    
    init(brand: String, volume: Int, price: Int, productName: String, expiryDate: Date, calorie: Int, fatRate: Int, smell: String) {
        self._smell = smell
        super.init(brand: brand, volume: volume, price: price, productName: productName, expiryDate: expiryDate, calorie: calorie, fatRate: fatRate)
    }
    
    var smell: String {
        return self._smell
    }
    
    override var description: String {
        return "딸기우유(\(StrawberryMilk.typeName)) - \(super.description)"
    }
}
