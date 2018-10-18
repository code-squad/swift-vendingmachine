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
    var expire: Date {
        return date
    }
    
    override var description: String {
        return "\(self.identifier) - \(brand), \(volume)ml, \(price)원, \(name), \(date.readable)"
    }
    
    init(brand: String, volume: Int, price: Int, name: String, date: Date) {
        self.brand = brand
y        self.volume = volume
        self.price = price
        self.name = name
        self.date = date
    }
    
    func isValidate(at target: Date = Date()) -> Bool {
        return target < expire
    }
    
    func summary(isSelectable: Bool, with count: Int) -> String {
        return isSelectable ? "\(name) \(price)원 (\(count)개)" : "\(name) (\(count)개)"
    }
    
}
