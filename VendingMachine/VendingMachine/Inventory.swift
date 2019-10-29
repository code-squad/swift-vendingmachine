//
//  Inventory.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Storable {
    mutating func addStock(_ beverage: Beverage)
    mutating func addStock(beverage: Beverage, count: Int)
    var hotBeverages: Stock { get }
}

typealias Stock = [Beverage : Int]

struct Inventory: Storable {
    private var stock: Stock
    
    init(stock: Stock) {
        self.stock = stock
    }
    
    mutating func addStock(_ beverage: Beverage) {
        stock[beverage] = (stock[beverage] ?? 0) + 1
    }
    
    mutating func addStock(beverage: Beverage, count: Int) {
        stock[beverage] = (stock[beverage] ?? 0) + count
    }
    
    var hotBeverages: Stock {
        return stock.filter() {
            return $0.key.isHot == true
        }
    }
    
    var expiredBeverages: Stock {
        return stock.filter() {
            return $0.key.isValidate == false
        }
    }
}
