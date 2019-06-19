//
//  Drink.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/18/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Drink: CustomStringConvertible, Hashable {
    static func == (lhs: Drink, rhs: Drink) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    private let brand: String
    private let ml: Int
    private var price: Int
    private let name: String
    private let productDate: Date
    private let barcode: Barcode
    private let expirationDate: Date
    internal var hashValue: Int {
        return name.hashValue
    }
    
    var description: String {
        return "\(brand), \(ml)ml, \(price)원, \(name), \(DateConverter.dateToString(date: productDate))"
    }
    
    init(brand: String, ml: Int, price: Int, name: String, productDate: String, barcode: Barcode, expirationDate: String) {
        self.brand = brand
        self.ml = ml
        self.price = price
        self.name = name
        self.productDate = DateConverter.stringToDate(string: productDate)
        self.barcode = barcode
        self.expirationDate = DateConverter.stringToDate(string: expirationDate)
    }
    
    func validate(with date:String) -> Bool {
        let date = DateConverter.stringToDate(string: date)
        
        return date < expirationDate
    }
    
    func validate() -> Bool {
        return Date.init() < expirationDate
    }
    
    func isBuyable (money: Int) -> Bool {
        return money > price
    }
}
