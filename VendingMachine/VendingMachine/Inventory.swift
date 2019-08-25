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
        inventory[beverage]? -= 1
    }
    
    /// 모든 재고 리스트를 보여준다.
    func showAllList(with show: ([(name: String, price: Int, value: Int)]) -> Void) {
        let names = inventory.map { ($0.key.productName, $0.key.productPrice, $0.value) }
        show(names)
    }
    
    /// 구매 가능한 재고 리스트를 보여준다.
    func showPurchaseableList(money: Int, with show: ([(name: String, price: Int, value: Int)]) -> Void) {
        let list = fetchPurchaseableList(with: money)
            .map { ($0.key.productName, $0.key.productPrice, $0.value) }
        show(list)
    }
    
    /// 잔액으로 구매 가능한 재고를 리턴한다.
    private func fetchPurchaseableList(with balance: Int) -> [Beverage: Int] {
        let purchaseableList = inventory
            .filter { $0.key.productPrice <= balance }
        return purchaseableList
    }
    
    /// 잔액으로 음료가 구매 가능한지 여부를 리턴한다.
    func canPurchaseBeverage(_ beverage: Beverage, with balance: Int) -> Bool {
        guard haveInStock(beverage) else {
            return false
        }
        let purchaseableList = fetchPurchaseableList(with: balance)
        return purchaseableList.keys.contains(beverage)
    }
    
    /// 음료의 재고가 있는지 없는지 리턴한다.
    private func haveInStock(_ beverage: Beverage) -> Bool {
        return inventory[beverage] != nil && inventory[beverage]! > 0
    }
    
    subscript(index: Int) -> Beverage? {
        get {
            guard index > -1 && index < beverages.endIndex else {
                return nil
            }
            return beverages[index]
        }
    }
}

// MARK: - Filter by conditions
extension Inventory {
    /// 재고를 조건에 따라 필터링한 결과를 리턴한다.
    func filter(by condition: Condition) -> [Beverage] {
        return beverages.filter { condition.filteringCommand($0) }
    }
    
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
