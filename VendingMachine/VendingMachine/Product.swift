//
//  Product.swift
//  VendingMachine
//
//  Created by jang gukjin on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Product: CustomStringConvertible {
    private var brand: String
    private var capacity: Int
    private var price: Int
    private var name: String
    private var date: Date
    
    var description: String {
        return ("\(brand), \(capacity), \(price), \(name), \(date)")
    }
    
    init(brand: String, capacity: Int, price: Int, name: String, date: Date) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.date = date
    }
    
}
