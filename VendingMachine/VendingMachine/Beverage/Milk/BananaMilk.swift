//
//  BananaMilk.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 12..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    private(set) var ingredients: String
    override init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ manufacturedDate: Date, _ expirationDate: Date, _ calories: Int, _ menuType: VendingMachine.Menu, manufacturerCode: Int, packingMaterial: String) {
        self.ingredients = "바나나농축액"
        super.init(brand, volume, price, productName, manufacturedDate, expirationDate, calories, menuType, manufacturerCode: manufacturerCode, packingMaterial: packingMaterial)
    }

    convenience init(_ menu: VendingMachine.Menu) {
        self.init("서울우유", 200, 1000, "날마다바나나우유", Date(timeIntervalSinceNow: 0), Date(timeIntervalSinceNow: 60*60*24*7), 220, menu, manufacturerCode: 1001, packingMaterial: "종이")
    }

    override var description: String {
        return String.init(describing: type(of: self))
//        return "바나나우유(" + String.init(describing: type(of: self)) + ") - " + super.description
    }
}
