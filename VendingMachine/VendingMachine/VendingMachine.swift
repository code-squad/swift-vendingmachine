//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class VendingMachine {
    private var balance: Money = Money()
    private var history: [Sellable] = []
    private var inventory: Storable
    
    init(inventory: Storable) {
        self.inventory = inventory
    }
    
    func insert(money: Int) -> Bool {
        let insertResult = balance.add(money: money)
        
        return insertResult
    }
    
    func inquireBalance() -> Money {
        return balance
    }
    
    func purchaseProduct(index: Int) -> Sellable? {
        let purchasableProduct = fetchPurchasableProducts()
        guard let beverage = inventory.takeProduct(at: index) else {
            return nil
        }
        
        if purchasableProduct.contains(where: { $0.objectID == beverage.objectID }) {
            balance -= beverage.productPrice
            history.append(beverage)
            
            return beverage
        }
        
        return nil
    }
    
    func addStock(_ product: Sellable) {
        inventory.addStock(product)
    }
    
    func fetchHistory() -> [Sellable] {
        return history
    }
    
    func fetchPurchasableProducts() -> [Sellable] {
        return inventory.search(option: .purchasable, balance: balance)
    }
    
    func fetchHotProducts() -> [Sellable] {
        return inventory.search(option: .hot)
    }
    
    func fetchExpiredProducts() -> [Sellable] {
        return inventory.search(option: .expired)
    }
    
    func fetchAllProducts() -> [Sellable] {
        return inventory.search(option: .all)
    }
    
    func showBalance(form: (Money) -> ()) {
        form(balance)
    }
    
    func showInventory(form: ([(product: Sellable, count: Int)]) -> ()) {
        inventory.showInventory(form: form)
    }
}
