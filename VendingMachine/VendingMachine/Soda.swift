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
    init(menu: Menu, brand: String, weight: Int, price: Int, name: String, manufactureDate: Date) {
        self.menu = menu
        super.init(brand: brand, weight: weight, price: price, name: name, manufactureDate: manufactureDate)
    }
    override var description: String {
        return "\(self.menu) - \(super.description)"
    }

}
