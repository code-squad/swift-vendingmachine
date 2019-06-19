//
//  Drink.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/18/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Drink: CustomStringConvertible {
    private let brand: String
    private let ml: Int
    private var price: Int
    private let name: String
    private let productDate: Date
    private let barcode: Barcode
    private let expirationDate: Date
    
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
}
