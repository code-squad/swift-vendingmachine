//
//  SoftDrink.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 11..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class SoftDrink: Beverage {
    private let selectedMenu: Menus
    enum Menus: String, CustomStringConvertible {
        case coke = "콜라"
        case cider = "사이다"
        case fanta = "환타"
        var description: String {
            return self.rawValue
        }
    }
    init(selectedMenu: Menus, _ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ manufacturedDate: Date) {
        self.selectedMenu = selectedMenu
        super.init(brand, volume, price, productName, manufacturedDate)
    }

    override var description: String {
        return self.selectedMenu.description + " - " + super.description
    }
}
