//
//  CantataCoffee.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 12..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class CantataCoffee: Coffee {
    private(set) var ingredients: String
    override init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ manufacturedDate: Date, _ expirationDate: Date, _ calories: Int, _ menuType: VendingMachine.Menu, caffeineLevels: Int, isHot: Bool, isSweetened: Bool) {
        self.ingredients = "커피농축액(브라질산)"
        super.init(brand, volume, price, productName, manufacturedDate, expirationDate, calories, menuType, caffeineLevels: caffeineLevels, isHot: isHot, isSweetened: isSweetened)
    }

    convenience init(_ menu: VendingMachine.Menu) {
        self.init("롯데칠성음료", 200, 2200, "칸타타", Date(timeIntervalSinceNow: 0), Date(timeIntervalSinceNow: 60*60*24*14), 250, menu, caffeineLevels: 10, isHot: false, isSweetened: true)
    }

    override var description: String {
        return String.init(describing: type(of: self))
//        return "칸타타커피(" + String.init(describing: type(of: self)) + ") - " + super.description
    }
}
