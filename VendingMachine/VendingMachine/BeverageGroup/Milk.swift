//
//  Milk.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    var expirationDate: Date
    override init(brand: String, weight: Int, price: Int, name: String, manufactureDate: Date) {
        self.expirationDate = manufactureDate.addingTimeInterval(864000)
        super.init(brand: brand, weight: weight, price: price, name: name, manufactureDate: manufactureDate)
    }
    override var description: String {
        return " - \(super.description)"
    }

}
