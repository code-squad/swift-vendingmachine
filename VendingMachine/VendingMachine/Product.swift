//
//  Product.swift
//  VendingMachine
//
//  Created by jang gukjin on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Product: Equatable, CustomStringConvertible  {
    private var brand: String
    private var capacity: Int
    private var price: Int
    private var name: String
    private var date: Date
    
    var description: String {
        return ("\(name), \(price)원")
    }
    
    init(brand: String, capacity: Int, price: Int, name: String, stringDate: String) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.date = DateUtil.convertDate(of: stringDate)
    }
    
    func getName() -> String {
        return name
    }
    
    func validate() -> Bool {
        return date > Date()
    }
    
    func getPrice() -> Int {
        return price
    }
    
    static func ==(lhs: Product, rhs: Product) -> Bool {
    return lhs.name == rhs.name && lhs.price == rhs.price
    }
}

