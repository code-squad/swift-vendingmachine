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
    mutating func takeOutBeverage(at index: Int) -> Beverage
    var hotBeverages: [Beverage] { get }
    var expiredBeverages: [Beverage] { get }
}

struct Inventory: Storable {
    private var stock: [Beverage]
    
    init(stock: [Beverage]) {
        self.stock = stock
    }
    
    private func countStock() -> [(Beverage, Int)] {
        let countResult = stock.reduce([Beverage : Int](), { (countResult: [Beverage : Int], beverage : Beverage) -> [Beverage : Int] in
            var countResult = countResult
            countResult[beverage] = (countResult[beverage] ?? 0) + 1
            return countResult
        }).sorted(by: <)
        
        return countResult
    }
    
    mutating func addStock(_ beverage: Beverage) {
        stock.append(beverage)
    }
    
    mutating func takeOutBeverage(at index: Int) -> Beverage {
        let stockCounter = countStock()
        let beverage = stockCounter[index].0

        if let firstIndex = stock.firstIndex(of: beverage) {
            stock.remove(at: firstIndex)
        }
        
        return beverage
    }
    
    var hotBeverages: [Beverage] {
        return stock.filter() { $0.isHot == true }
    }
    
    var expiredBeverages: [Beverage] {
        return stock.filter() { $0.isValidate == false }
    }
}
