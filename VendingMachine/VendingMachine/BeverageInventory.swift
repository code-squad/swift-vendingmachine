//
//  Inventory.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Storable {
    mutating func addStock(_ product: Sellable)
    mutating func takeProduct(at index: Int) -> Sellable?
}

struct BeverageInventory: Storable {
    private var stock: [Sellable]
    
    init(stock: [Beverage]) {
        self.stock = stock
    }
    
    private var stockCounter: [(ObjectIdentifier, Int)] {
        var countResult = [ObjectIdentifier : Int]()
        
        stock.forEach { countResult[$0.objectID] = (countResult[$0.objectID] ?? 0) + 1 }
        
        return countResult.sorted(by: <)
    }
    
    mutating func addStock(_ product: Sellable) {
        stock.append(product)
    }
    
    mutating func takeProduct(at index: Int) -> Sellable? {
        let id = stockCounter[index - 1].0
        
        guard let index = stock.firstIndex(where: { $0.objectID == id }) else {
            return nil
        }
        
        return stock.remove(at: index)
    }
    
    
}
