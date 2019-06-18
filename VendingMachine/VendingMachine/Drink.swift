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
    
    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        
        return "\(brand), \(ml)ml, \(price)원, \(name), \(dateFormatter.string(from: productDate))"
    }
    
    init(brand: String, ml: Int, price: Int, name: String, productDate: String) {
        self.brand = brand
        self.ml = ml
        self.price = price
        self.name = name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        
        if let date = dateFormatter.date(from: productDate) {
            self.productDate = date
        } else {
            self.productDate = Date.init()
        }
    }
}
