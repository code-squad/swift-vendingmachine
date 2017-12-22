//
//  CiderSoftDrink.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 12..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class CiderSoftDrink: SoftDrink {
    private let ingredients: String
    override init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ manufacturedDate: Date, _ expirationDate: Date, _ calories: Int, _ menuType: VendingMachine.Menu, carbonContent: Int) {
        self.ingredients = "합성착향료(레몬라임향)"
        super.init(brand, volume, price, productName, manufacturedDate, expirationDate, calories, menuType, carbonContent: carbonContent)
    }

    convenience init(_ menu: VendingMachine.Menu) {
        self.init("롯데칠성음료", 350, 2000, "사이다", Date(timeIntervalSinceNow: 0), Date(timeIntervalSinceNow: 60*60*24*30*6), 250, menu, carbonContent: 60)
    }

    override var description: String {
        return String.init(describing: type(of: self))
//        return "사이다(" + String.init(describing: type(of: self)) + ") - " + super.description
    }
}
