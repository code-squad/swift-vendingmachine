//
//  StockManager.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 12..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct StockManager: Equatable {
    
    private var stock: [ProductType:Products]
    
    init(stock: [ProductType:Products]) {
        self.stock = stock
    }
    
    mutating func add(beverage: Beverage) {
        guard let productType = beverage.productType else {
            return
        }
        if var products = self.stock[productType] {
            products.append(beverage)
        } else {
            self.stock[productType] = Products(beverages: [beverage])
        }
    }
}

struct Products: Equatable {
    
    private var beverages: [Beverage]
    
    init(beverages: [Beverage]) {
        self.beverages = beverages
    }
    
    mutating func append(_ beverage: Beverage) {
        self.beverages.append(beverage)
    }
}
