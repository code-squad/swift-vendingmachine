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
    var hotBeverages: [Beverage] { get }
    var expiredBeverages: [Beverage] { get }
}

struct Inventory: Storable {
    private var stock: [Beverage]
    
    init(stock: [Beverage]) {
        self.stock = stock
    }
    
    mutating func addStock(_ beverage: Beverage) {
        stock.append(beverage)
    }
    
    var hotBeverages: [Beverage] {
        return stock.filter() { $0.isHot == true }
    }
    
    var expiredBeverages: [Beverage] {
        return stock.filter() { $0.isValidate == false }
    }
}
