//
//  Milk.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 16..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Milk : Beverage {
    private var brand : String
    private var kind : String
    override var description: String {
        return "\(self.kind) - \(self.brand), \(super.description)"
    }
    
    init(kind : String, brand : String, name : String, volume : Int, price : Int, date : Date) {
        self.brand = brand
        self.kind = kind
        super.init(name: name, volume: volume, price: price, date: date)
    }
}

