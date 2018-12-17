//
//  File.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 17..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Beverage {
    private var brand: String
    private var size: Int
    private var price: Int
    private var name: String
    private var packDate: Date
    
    init(brand:String, size:Int, price:Int, name:String, packDate:Date) {
        self.brand = brand
        self.size = size
        self.price = price
        self.name = name
        self.packDate = packDate
    }
}
