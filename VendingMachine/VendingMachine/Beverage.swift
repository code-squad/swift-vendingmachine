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
        return "\(self.brand), \(self.size), \(self.price), \(self.name), \(self.openDate)"
    }
    
    private var brand: String
    private var size: Int
    private var price: Int
    private var name: String
    private var openDate: Date
    
    init(brand:String, size:Int, price:Int, name:String, openDate:Date) {
        self.brand = brand
        self.size = size
        self.price = price
        self.name = name
        self.openDate = openDate
    }
}
