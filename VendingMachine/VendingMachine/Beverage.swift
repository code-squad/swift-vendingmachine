//
//  File.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 12..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class Beverage: CustomStringConvertible {
    private (set) var brand: String
    private (set) var volume: Int
    private (set) var price: Int
    private (set) var name: String
    private (set) var manufacturingDate: Date
    var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(name), \(manufacturingDate)"
    }
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturingDate: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturingDate = manufacturingDate
    }
}
