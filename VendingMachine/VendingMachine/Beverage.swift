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
    
    init(brand: String, capacity: Int, price: Int, name: String, manufacturedDate: String) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.manufacturedDate = manufacturedDate.customDateFormat
    }
    
    var productType: ProductType? {
        let selfType = String(self.description.split(separator: ",").first ?? "")
        return ProductType(rawValue: selfType)
    }
    
    override var description: String {
        return "\(type(of: self)), \(self.brand), \(self.capacity)ml, \(self.price)원, \(self.name), \(self.manufacturedDate.customDateFormat)"
    }
    
    func isExpensive(than price: Int) -> Bool {
        return self.price > price
    }
    
    func isExpired(_ checkDate: Date) -> Bool {
        return manufacturedDate + self.productType!.expiratation < checkDate
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let beverage = object as? Beverage else {
            return false
        }
        return self.productType! == beverage.productType!
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
