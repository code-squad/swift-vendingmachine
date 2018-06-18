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
    private let tenDaysPeriod: TimeInterval = 86400 * 10
    
    override init(brand: String, capacity: Int, price: Int, name: String, manufacturedDate: String) {
        self.expiredDate = manufacturedDate.customDateFormat.addingTimeInterval(self.tenDaysPeriod)
        super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedDate: manufacturedDate)
    }
    
    func isOverExpired(with checkDate: Date) -> Bool {
        return self.expiredDate < checkDate
    }
}
