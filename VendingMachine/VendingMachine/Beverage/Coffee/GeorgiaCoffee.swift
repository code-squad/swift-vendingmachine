//
//  GeorgiaCoffee.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 12..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class GeorgiaCoffee: Coffee {
    private(set) var ingredients: String
    override init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ manufacturedDate: Date, _ expirationDate: Date, _ calories: Int, _ menuType: VendingMachine.Menu, caffeineLevels: Int, isHot: Bool, isSweetened: Bool) {
        self.ingredients = "에메랄드 마운틴 블렌드 커피 추출액"
        super.init(brand, volume, price, productName, manufacturedDate, expirationDate, calories, menuType, caffeineLevels: caffeineLevels, isHot: isHot, isSweetened: isSweetened)
    }

    convenience init(_ menu: VendingMachine.Menu) {
        self.init("코카콜라", 200, 2200, "조지아", Date(timeIntervalSinceNow: 0), Date(timeIntervalSinceNow: 60*60*24*2), 100, menu, caffeineLevels: 25, isHot: true, isSweetened: false)
    }

    override var description: String {
        return String.init(describing: type(of: self))
//        return "조지아커피(" + String.init(describing: type(of: self)) + ") - " + super.description
    }
}
