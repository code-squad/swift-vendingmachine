//
//  Beverage.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 1. 26..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible {
    var type: String {
        return "음료"
    }
    var brand: String
    var weight: Int
    var price: Int
    var name: String
    var MFDDate: Date

    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let MFDFormatted = dateFormatter.string(from: self.MFDDate as Date)
        return "\(type) - \(brand), \(weight)ml, \(price)원, \(name), \(MFDFormatted)"
    }

    init(brand: String, weight: Int, price: Int, name: String, MFDDate: Date) {
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.MFDDate = MFDDate
    }
}
