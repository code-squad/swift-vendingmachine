//
//  Packages.swift
//  VendingMachine
//
//  Created by Elena on 02/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Packages: NSObject {
    
    private var beverage: [Beverage]
    
    init(beverages: [Beverage]) {
        self.beverage = beverages
    }
    
    func add(beverage: Beverage) {
        self.beverage.append(beverage)
    }
    
    var count: Int {
        return beverage.count
    }
    
    func removeOneGoods() -> Beverage? {
        if beverage.isEmpty { return nil }
        return beverage.removeFirst()
    }
    
    override var description: String {
        guard let goods = beverage.first else { return "" }
        return goods.description
    }
    
    func isEmpty() -> Bool {
        return beverage.isEmpty
    }
    
    func isBuyable(with money: Int) -> Bool {
        guard let one = beverage.first else { return false }
        return one.isBuy(cash: money)
    }
    
    func isHotBeverage() -> Bool {
        for anyThing in beverage {
            guard let coffee = anyThing as? Coffee else { continue }
            if coffee.isHot() { return true }
        }
        return false
    }
    
    func goBadBeverages() -> [Beverage] {
        var badBeverages: [Beverage] = []
        for beverage in beverage {
            if beverage.isEqualExpirationDate() { continue }
            badBeverages.append(beverage)
        }
        return badBeverages
    }
    
    func removeOne() -> Beverage? {
        if beverage.isEmpty { return nil }
        return beverage.removeFirst()
    }

}
