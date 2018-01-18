//
//  Beverage .swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: TypeName, CustomStringConvertible {
    private let brand: String
    private let volume: Int
    private let price: Int
    private let productName: String
    private let expiryDate: Date
    private let calorie: Int
    private let quantity: Int
    
    init(brand: String, volume: Int, price: Int, productName: String, expiryDate: Date, calorie: Int, quantity: Int) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.productName = productName
        self.expiryDate = expiryDate
        self.calorie = calorie
        self.quantity = quantity
    }
    
    var description: String {
        let dateFormatter = DateUtility.formatDate(format: "yyyyMMdd")
        return "\(self.brand), \(self.volume)ml, \(self.price)원, \(self.productName), \(dateFormatter.string(from: self.expiryDate)), \(self.calorie), \(self.quantity))"
    }
    
    func isExpired(with date: Date) -> Bool {
        return date <= self.expiryDate
    }
    
    func isLowCalorie() -> Bool {
        return self.calorie <= 200
    }
}
