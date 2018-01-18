//
//  Beverage .swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Beverage: TypeName, CustomStringConvertible {
    private let _brand: String
    private let _volume: Int
    private let _price: Int
    private let _productName: String
    private let _expiryDate: Date
    private let _calorie: Int
    
    init(brand: String, volume: Int, price: Int, productName: String, expiryDate: Date, calorie: Int) {
        self._brand = brand
        self._volume = volume
        self._price = price
        self._productName = productName
        self._expiryDate = expiryDate
        self._calorie = calorie
    }
    
    var description: String {
        let dateFormatter = DateUtility.formatDate(format: "yyyyMMdd")
        return "\(self._brand), \(self._volume)ml, \(self._price)원, \(self._productName), \(dateFormatter.string(from: self._expiryDate)), \(self._calorie)"
    }
    
    func isExpired(with date: Date) -> Bool {
        return date <= self._expiryDate
    }
    
    func isLowCalorie() -> Bool {
        return self._calorie <= 200
    }
    
    var price: Int {
        return self._price
    }
}
