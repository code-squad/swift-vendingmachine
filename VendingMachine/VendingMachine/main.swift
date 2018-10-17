//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

class VendingMachine {
    private var list: [Beverage] = []
    
    init(_ list: [Beverage]) {
        self.list = list
    }
    
    func display(_ handler: (Beverage)->()) {
        list.forEach {
            handler($0)
        }
    }
}

let beverages: [Beverage] = [
    Latte(milk: 0.2, art: .none, caffeine: 0.3, brand: "맥심", volume: 250, price: 3000, name: "TOP라때", date: Date(timeIntervalSinceNow: -Date.convert(weeks: 1))),
    FruitMilk(fruit: .strawberry, fat: 0.3, code: "강원03-21", brand: "서울우유", volume: 250, price: 2000, name: "딸기듬뿍", date: Date(timeIntervalSinceNow: -Date.convert(weeks: 2))),
    RiceWine(area: .busan, alcohol: 0.3, brand: "금정산성토산주", volume: 400, price: 7000, name: "금정산성막걸리", date: Date(timeIntervalSinceNow: -Date.convert(days: 5)))
]

VendingMachine(beverages).display { print($0) }
