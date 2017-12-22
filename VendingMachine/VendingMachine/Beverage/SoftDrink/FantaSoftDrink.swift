//
//  FantaSoftDrink.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 12..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class FantaSoftDrink: SoftDrink {
    private let ingredients: String
    override init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ manufacturedDate: Date, _ expirationDate: Date, _ calories: Int, _ menuType: VendingMachine.Menu, carbonContent: Int) {
        self.ingredients = "합성착향료(오렌지향)"
        super.init(brand, volume, price, productName, manufacturedDate, expirationDate, calories, menuType, carbonContent: carbonContent)
    }

    convenience init(_ menu: VendingMachine.Menu) {
        self.init("코카콜라컴퍼니", 350, 2000, "환타", Date(timeIntervalSinceNow: 0), Date(timeIntervalSinceNow: 60*60*24*30*7), 300, menu, carbonContent: 40)
    }

    override var description: String {
        return String.init(describing: type(of: self))
//        return "환타(" + String.init(describing: type(of: self)) + ") - " + super.description
    }
}
