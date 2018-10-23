//
//  Beverage.swift
//  VendingMachine
//
//  Created by 이동건 on 15/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Beverage: NSObject {
    private var brand: String
    private var volume: Int
    private var price: Int
    private var name: String
    private var date: Date
    var expire: Date {
        return date
    }
    
    override var description: String {
        return "\(self.identifier) - \(brand), \(volume)ml, \(price)원, \(name), \(date.readable)"
    }
    
    init(brand: String, volume: Int, price: Int, name: String, date: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.date = date
    }
    
    func isValidate(at target: Date = Date()) -> Bool {
        return target < expire
    }
    
    func isPurchasable(with money: Int) -> Int? {
        return price <= money ? price : nil
    }
    
    // isSelectable = 선택할 수 있는지 유무 : 잔액이 0 이라면 선택X / 그 이상이라면 선택할 수 있게 가격과 함께 반환
    func tag(hasPrice: Bool) -> String {
        return hasPrice ? "\(name) \(price)원" : "\(name)"
    }
    
    func isEqual(to object: Beverage?) -> Bool {
        return object?.brand == self.brand && object?.name == self.name && object?.date == self.date
    }
}

extension Beverage {
    static var sample: [Beverage] {
        let beverages = [
            Latte(milk: 0.2, art: .none, caffeine: 0.3, brand: "맥심", volume: 250, price: 3000, name: "TOP라때", date: Date(timeIntervalSinceNow: -Date.convert(weeks: 1))),
           FruitMilk(fruit: .strawberry, fat: 0.3, code: "강원03-21", brand: "서울우유", volume: 250, price: 2000, name: "딸기듬뿍", date: Date(timeIntervalSinceNow: -Date.convert(weeks: 2))),
           FruitMilk(fruit: .strawberry, fat: 0.3, code: "강원03-21", brand: "서울우유", volume: 250, price: 2000, name: "딸기듬뿍", date: Date(timeIntervalSinceNow: -Date.convert(weeks: 1))),
           RiceWine(area: .busan, alcohol: 0.3, brand: "금정산성토산주", volume: 400, price: 7000, name: "금정산성막걸리", date: Date(timeIntervalSinceNow: -Date.convert(days: 5))),
           RiceWine(area: .busan, alcohol: 0.3, brand: "금정산성토산주", volume: 400, price: 7000, name: "금정산성막걸리", date: Date(timeIntervalSinceNow: -Date.convert(days: 3))),
           RiceWine(area: .busan, alcohol: 0.3, brand: "금정산성토산주", volume: 400, price: 7000, name: "금정산성막걸리", date: Date(timeIntervalSinceNow: -Date.convert(days: 6)))]
        return beverages
    }
}
