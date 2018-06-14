//
//  Milk.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 5..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    
    private let expiredDate: Date
    private let expiredPeriod: TimeInterval = 864000 // 10 days
    
    override init(brand: String, capacity: Int, price: Int, name: String, manufacturedDate: String, isHot: Bool) {
        self.expiredDate = manufacturedDate.customDateFormat.addingTimeInterval(self.expiredPeriod)
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate, isHot: isHot)
    }
    
    func isOverExpired(with checkDate: Date) -> Bool {
        return self.expiredDate < checkDate
    }
}
