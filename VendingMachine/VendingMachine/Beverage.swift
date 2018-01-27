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
    private(set) var brand: String
    private(set) var weight: Int
    private(set) var price: Int
    private(set) var name: String
    private(set) var MFDDate: MyDate

    var description: String {
        return "\(type) - \(brand), \(weight)ml, \(price)원, \(name), \(MFDDate.description)"
    }

    init(brand: String, weight: Int, price: Int, name: String, MFDDate: String) {
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.MFDDate = MyDate(YYYYMMDD: MFDDate)
    }

}
