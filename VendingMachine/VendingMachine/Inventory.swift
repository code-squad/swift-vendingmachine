//
//  Inventory.swift
//  VendingMachine
//
//  Created by 김성현 on 04/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

typealias Inventory = [String: Item]

extension Inventory {
    var hotBeverages: [String] {
        return self.filter { (_, item) in
            item.isHot
            }.keys.map { $0 }
    }
    
    var expiredBeverages: [Beverage] {
        let allBeverages = self.values.flatMap { $0.beverages }
        return allBeverages.filter { $0.isExpired(targetDate: Date()) }
    }
    
    mutating func addItem(_ beverage: Beverage) {
        if self[beverage.name] == nil {
            self[beverage.name] = Item(price: beverage.price, beverage: beverage)
        } else {
            self[beverage.name]!.add(beverage)
        }
    }
    
    mutating func addItems(_ beverages: [Beverage]) {
        beverages.forEach { addItem($0) }
    }
}
