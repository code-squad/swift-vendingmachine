//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol VendingMachineManagerable {
    func addStock(_ product: Sellable)
    func removeStock(_ product: Sellable)
    func fetchHistory() -> [Sellable]
    func fetchHotProducts() -> [Sellable]
    func fetchExpiredProducts() -> [Sellable]
    func fetchPurchasableProducts() -> [Sellable]
    func fetchAllProducts() -> [Sellable]
}

protocol VendingMachineUserable {
    func insert(money: Int) -> Bool
    func purchaseProduct(index: Int) -> Sellable?
}

class VendingMachine {
    private var balance: Money = Money()
    private var history: [Sellable] = []
    private var inventory: Storable
    
    init(inventory: Storable) {
        self.inventory = inventory
    }
    
    func showBalance(form: (Money) -> ()) {
        form(balance)
    }
    
    func showInventory(form: (Int, String, Int, Int) -> ()) {
        inventory.showInventory(form: form)
    }
}

extension VendingMachine: VendingMachineManagerable {
    func addStock(_ product: Sellable) {
        inventory.addStock(product)
    }
    
    func removeStock(_ product: Sellable) {
        inventory.removeStock(product)
    }
    
    func fetchHistory() -> [Sellable] {
        return history
    }
    
    func fetchHotProducts() -> [Sellable] {
        return inventory.search(option: .hot)
    }
    
    func fetchExpiredProducts() -> [Sellable] {
        return inventory.search(option: .expired)
    }
    
    func fetchPurchasableProducts() -> [Sellable] {
        return inventory.search(option: .purchasable, balance: balance)
    }
    
    func fetchAllProducts() -> [Sellable] {
        return inventory.search(option: .all)
    }
}

extension VendingMachine: VendingMachineUserable {
    func insert(money: Int) -> Bool {
        let insertResult = balance.add(money: money)
        
        return insertResult
    }
    
    func purchaseProduct(index: Int) -> Sellable? {
        let purchasableProduct = fetchPurchasableProducts()
        guard let beverage = inventory.takeProduct(at: index) else {
            return nil
        }
        
        if !purchasableProduct.contains(where: { $0.objectID == beverage.objectID }) {
            addStock(beverage)
            
            return nil
        }
        
        balance -= beverage.productPrice
        history.append(beverage)
        
        return beverage
    }
}
