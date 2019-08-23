//
//  Inventory.swift
//  VendingMachine
//
//  Created by CHOMINJI on 23/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Inventory {
    private var inventory: [Beverage: Int] = [:]
    
    private var beverages: [Beverage] {
        return Array(inventory.keys)
    }
    
    func append(_ beverage: Beverage, count: Int = 0) {
        inventory[beverage, default: 0] += count
    }
    
    func purchase(_ beverage: Beverage) {
        inventory[beverage]! -= 1
    }
    
    func showStock(with completion: ([(name: String, price: Int, value: Int)]) -> Void) {
        let names = inventory.map { ($0.key.name, $0.key.price, $0.value) }
        completion(names)
    }
    
    func fetchPurchaseableList(with balance: Int) -> [String] {
        let beveragePrices = beverages
            .filter { $0.price <= balance }
            .map { $0.name }
        return beveragePrices
    }
    
    func hasBeverage(_ beverage: Beverage) -> Bool {
        return inventory[beverage] != nil && inventory[beverage] != 0
    }
    
    func canPurchaseBeverage(_ beverage: Beverage, with balance: Int) -> Bool {
        guard hasBeverage(beverage) else {
            return false
        }
        let temp = beverages.filter { $0.price <= balance }
        return temp.contains(beverage)
    }
    
    func filter(by condition: Condition) -> [Beverage] {
        return beverages.filter { condition.filteringCommand($0) }
    }
    
    subscript(index: Int) -> Beverage {
        get {
            return Array(inventory)[index].key
        }
    }
    
}

extension Inventory {
    enum Condition {
        case all
        case hot
        case expired
        
        var filteringCommand: (Beverage) -> Bool {
            switch self {
            case .all:
                return { _ in true }
            case .hot:
                return { $0.isHot }
            case .expired:
                return { $0.isExpired }
            }
        }
    }
}
