//
//  File.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 12..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class Beverage {
    private let brand: String
    private let volume: Int
    private let price: Int
    private let name: String
    private let manufacturingDate: Date
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturingDate: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturingDate = manufacturingDate
    }
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(name), \(manufacturingDate)"
    }
}
