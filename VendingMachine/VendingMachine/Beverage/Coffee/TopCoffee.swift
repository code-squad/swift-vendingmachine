//
//  TopCoffee.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 12..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class TopCoffee: Coffee {
    private(set) var ingredients: String
    override init(_ brand: String, _ volume: Int, _ price: Int, _ productName: String, _ manufacturedDate: Date, _ expirationDate: Date, _ calories: Int, _ menuType: VendingMachine.Menu, caffeineLevels: Int, isHot: Bool, isSweetened: Bool) {
        self.ingredients = "커피추출액(콜럼비아산)"
        super.init(brand, volume, price, productName, manufacturedDate, expirationDate, calories, menuType, caffeineLevels: caffeineLevels, isHot: isHot, isSweetened: isSweetened)
    }

    convenience init(_ menu: VendingMachine.Menu) {
        self.init("맥심", 200, 2200, "티오피", Date(timeIntervalSinceNow: 0), Date(timeIntervalSinceNow: 60*60*24*14), 240, menu, caffeineLevels: 20, isHot: true, isSweetened: true)
    }
    
    override var description: String {
        return String.init(describing: type(of: self))
//        return "TOP커피(" + String.init(describing: type(of: self)) + ") - " + super.description
    }
}
