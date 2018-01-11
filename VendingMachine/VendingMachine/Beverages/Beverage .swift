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
    
    init(brand: String, volume: Int, price: Int, productName: String, expiryDate: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.productName = productName
        self.expiryDate = expiryDate
    }
    
    var description: String {
        let dateFormatter = DateUtility.formatDate(format: "yyyyMMdd")
        return "\(self.brand), \(self.volume)ml, \(self.price)원, \(self.productName), \(dateFormatter.string(from: self.expiryDate))"
    }
}

protocol OutputPrintable: CustomStringConvertible {
    var description: String { get }
}
