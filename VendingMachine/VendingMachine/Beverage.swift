//
//  Beverage.swift
//  VendingMachine
//
//  Created by 이동건 on 15/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Beverage: NSObject {
    private var brand: String
    private var volume: Int
    private var price: Int
    private var name: String
    private var date: Date
    
    override var description: String {
        let displayable = convert()
        return "\(brand), \(volume)ml, \(price)원, \(name), \(displayable)"
    }
    
    init(brand: String, volume: Int, price: Int, name: String, date: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.date = date
    }
    
    private func convert() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: date)
    }
}
