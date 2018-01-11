//
//  Milk.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 11..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Milk: Beverage, BeverageMenu {
    typealias T = MilkMenu
    enum MilkMenu: Int, CustomStringConvertible {
        case Strawberry, Choco, Banana
        var description: String {
            switch self {
            case .Strawberry:
                return "딸기우유"
            case .Choco:
                return "초코우유"
            case .Banana:
                return "바나나우유"
            }
        }
    }
    var menu: MilkMenu // BeverageMenu<Milk>
    init(menu: MilkMenu, brand: String, weight: Int, price: Int, name: String, manufactureDate: Date) {
        self.menu = menu
        super.init(brand: brand, weight: weight, price: price, name: name, manufactureDate: manufactureDate)
    }
    override var description: String {
        return "\(self.menu) - \(super.description)"
    }

}
