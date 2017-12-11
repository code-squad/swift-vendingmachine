//
//  Milk.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 11..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    let selectedMenu: Menus
    enum Menus: String, CustomStringConvertible {
        case strawberry = "딸기우유"
        case banana = "바나나우유"
        case choco = "초코우유"
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
