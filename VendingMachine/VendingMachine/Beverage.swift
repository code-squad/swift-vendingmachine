//
//  Beverage.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 11..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible, Hashable {
    var hashValue: Int {
        return ObjectIdentifier(self).hashValue
    }

    static func ==(lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

    // 브랜드(String), 무게(Int), 가격(Int), 이름(String), 제조일자(Date)
    private let brand: String
    private let volume: Int
    // 가격은 노출 가능.
    private(set) var price: Int
    private let productName: String
    private let manufacturedDate: Date
    private let expirationDate: Date
    private(set) var calories: Int
    init() {
        self.brand = ""
        self.volume = 0
        self.price = 0
        self.productName = ""
        self.manufacturedDate = Date(timeIntervalSinceNow: 0)
        self.expirationDate = Date(timeIntervalSinceNow: 0)
        self.calories = 0
    }
    init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ manufacturedDate: Date, _ expirationDate: Date, _ calories: Int) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.productName = productName
        self.manufacturedDate = manufacturedDate
        self.expirationDate = expirationDate
        self.calories = calories
    }

    func isExpired(with date: Date) -> Bool {
        return self.expirationDate < date
    }

    func isLowCalorie() -> Bool {
        return self.calories < 100
    }

    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("YYYYMMdd")
        return "\(self.brand), \(self.volume)ml, \(self.price)원, \(self.productName), \(dateFormatter.string(from: self.manufacturedDate))"
    }
    
}
