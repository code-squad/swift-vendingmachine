//
//  Coffee.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage, CustomStringConvertible {
    enum Menu: Int, CustomStringConvertible {
        case Top, Kantata, Georgia
        var description: String {
            switch self {
            case .Top:
                return "TOP"
            case .Kantata:
                return "칸타타"
            case .Georgia:
                return "조지아"
            }
        }
    }
    var menu: Menu
    var brand: String
    var weight: Int
    var price: Int
    var name: String
    var manufactureDate: Date
    
    init(menu: Menu, brand: String, weight: Int, price: Int, name: String, manufactureDate: Date) {
        self.menu = menu
        self.brand = brand
        self.weight = weight
        self.price = price
        self.name = name
        self.manufactureDate = manufactureDate
    }
    var description: String {
        return "\(self.menu) - \(self.brand), \(self.weight)ml, \(self.price)원, \(self.name), \(self.manufactureDate)"
    }
}
