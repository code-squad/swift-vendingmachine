//
//  Soda.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Soda: Beverage {
    enum Menu: Int, CustomStringConvertible {
        case Coke, Sprite, Fanta
        var description: String {
            switch self {
            case .Coke:
                return "콜라"
            case .Sprite:
                return "사이다"
            case .Fanta:
                return "환타"
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
}
