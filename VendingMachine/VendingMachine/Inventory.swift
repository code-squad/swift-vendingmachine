//
//  Inventory.swift
//  VendingMachine
//
//  Created by CHOMINJI on 23/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

typealias InventoryInfo = ([(name: String, price: Int, value: Int)]) -> Void

class Inventory {
    private var inventory: [ObjectIdentifier: Item] = [:]
    private var objectIDs: [ObjectIdentifier] {
        return Array(inventory.keys)
    }
    
    func findItems(key objectID: ObjectIdentifier) -> Item {
        guard let oldItem = inventory[objectID] else {
            let newItem = Item()
            inventory[objectID] = newItem
            return newItem
        }
        return oldItem
    }
    
    func append(_ beverage: Beverage, count: Int = 0) {
        let items = findItems(key: beverage.objectID)
        items.append(beverage: beverage, count: count)
    }
    
    
    func purchase(_ beverage: Beverage) {
        let items = findItems(key: beverage.objectID)
        items.remove(beverage: beverage)
        if items.isEmpty {
            inventory[beverage.objectID] = nil
        }
    }
    
    /// 모든 재고 리스트를 보여준다.
    //    func showAllList(with show: InventoryInfo) {
    //        let names = inventory.map { ($0.key.itemName, $0.key.itemPrice, $0.value) }
    //        show(names)
    //    }
    //
    
    func showAllList(with show: InventoryInfo) {
        let bundle = inventory.values
            .filter { !$0.isEmpty }
            .map { $0.info }
        show(bundle)
    }
    
    func filter(by condition: Item.Condition) -> [Beverage] {
        return inventory.values
            .map { $0.filter(by: condition) }
            .reduce(into: [Beverage]()) { $0.append(contentsOf: $1) }
    }
    
    /// 음료의 재고가 있는지 없는지 리턴한다.
    private func haveInStock(_ beverage: Beverage) -> Bool {
        let items = findItems(key: beverage.objectID)
        return items.count > 0
    }
    
    func fetchBeverage(at index: Int) -> Beverage? {
        guard index > -1 && index < objectIDs.endIndex else {
            return nil
        }
        let id = objectIDs[index]
        let item = findItems(key: id)
        
        guard let beverage = item.fetchFirst() else {
            return nil
        }
        return beverage
    }
}
