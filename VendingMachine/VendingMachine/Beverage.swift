//
//  Beverage.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 5..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: NSObject {
    
    private let brand: String
    private let capacity: Int
    private let price: Int
    private let name: String
    private let manufacturedDate: Date
    private let expiration: TimeInterval
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedDate: String, expiration: TimeInterval) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacturedDate = manufacturedDate.customDateFormat
        self.expiration = expiration
    }
    
    override var description: String {
        return "\(self.name)"
    }
    
    func isExpensive(than price: Int) -> Bool {
        return self.price > price
    }
    
    func isExpired(_ checkDate: Date) -> Bool {
        return manufacturedDate + self.expiration < checkDate
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let beverage = object as? Beverage else {
            return false
        }
        return ObjectIdentifier(type(of: self)) == ObjectIdentifier(type(of: beverage))
    }
    
    func minusBeveragePrice(from balance: Int) -> Int {
        return balance - self.price
    }
    
    var beveragePrice: Int {
        return self.price
    }
}

extension String {
    var customDateFormat: Date {
        let formatter = DateFormatter(customDateFormat: "yyyyMMdd")
        return formatter.date(from: self) ?? Date()
    }
}

extension Date {
    var customDateFormat: String {
        let formatter = DateFormatter(customDateFormat: "yyyyMMdd")
        return formatter.string(from: self)
    }
    
    var today: String {
        return Date().customDateFormat
    }
}

extension DateFormatter {
    convenience init(customDateFormat: String) {
        self.init()
        self.dateFormat = customDateFormat
    }
}
