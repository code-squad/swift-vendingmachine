//
//  File.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 17..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible {
    var description: String {
        return "\(self.brand), \(self.size)ml, \(self.price)원, \(self.name), \(self.openDate.toString())"
    }
    
    private let brand: String
    private let size: Int
    private let price: Int
    private let name: String
    private let openDate: Date
    
    init(brand:String, size:Int, price:Int, name:String, openDate:Date) {
        self.brand = brand
        self.size = size
        self.price = price
        self.name = name
        self.openDate = openDate
    }
}
