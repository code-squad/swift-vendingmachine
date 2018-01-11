//
//  Coffee.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage, BeverageMenu {
    typealias T = CoffeeMenu
    enum CoffeeMenu: Int, CustomStringConvertible {
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
    var menu: CoffeeMenu
    init(menu: CoffeeMenu, brand: String, weight: Int, price: Int, name: String, manufactureDate: Date) {
        self.menu = menu
        super.init(brand: brand, weight: weight, price: price, name: name, manufactureDate: manufactureDate)
    }
    override var description: String {
        return "\(self.menu) - \(super.description)"
    }
}
