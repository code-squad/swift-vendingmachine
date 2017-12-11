//
//  Coffee.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 11..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Coffee: Beverage {
    let selectedMenu: Menus
    enum Menus: String, CustomStringConvertible {
        case top = "TOP"
        case cantata = "칸타타"
        case georgia = "조지아"
        var description: String {
            return self.rawValue
        }
    }
    init(selectedMenu: Menus, _ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ manufacturedDate: Date) {
        self.selectedMenu = selectedMenu
        super.init(brand, volume, price, productName, manufacturedDate)
    }

    override var description: String {
        return self.selectedMenu.description + "-" + super.description
    }
}
