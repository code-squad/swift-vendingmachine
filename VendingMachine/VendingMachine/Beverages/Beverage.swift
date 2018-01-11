//
//  Beverage .swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: OutputPrintable {
    private let brand: String
    private let volume: Int
    private let price: Int
    private let productName: String
    private let expiryDate: Date
    private let temperature: Int
    private let calorie: Int
    
    init(brand: String, volume: Int, price: Int, productName: String, expiryDate: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.productName = productName
        self.expiryDate = expiryDate
        self.temperature = 0
        self.calorie = 0
    }
    
    init(brand: String, volume: Int, price: Int, productName: String, expiryDate: Date, temperature: Int) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.productName = productName
        self.expiryDate = expiryDate
        self.temperature = temperature
        self.calorie = 0
    }
    
    init(brand: String, volume: Int, price: Int, productName: String, expiryDate: Date, calorie: Int) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.productName = productName
        self.expiryDate = expiryDate
        self.temperature = 0
        self.calorie = calorie
    }
    
    init(brand: String, volume: Int, price: Int, productName: String, expiryDate: Date, temperature: Int, calorie: Int) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.productName = productName
        self.expiryDate = expiryDate
        self.temperature = temperature
        self.calorie = calorie
    }
    
    var description: String {
        let dateFormatter = DateUtility.formatDate(format: "yyyyMMdd")
        return "\(self.brand), \(self.volume)ml, \(self.price)원, \(self.productName), \(dateFormatter.string(from: self.expiryDate))"
    }
    
    func isExpired(with date: Date) -> Bool {
        return date <= self.expiryDate
    }

    func isHot() -> Bool {
        return self.temperature > 60
    }
    
    func isLowCalorie() -> Bool {
        return self.calorie <= 200
    }
}

protocol OutputPrintable: CustomStringConvertible {
    var description: String { get }
}
