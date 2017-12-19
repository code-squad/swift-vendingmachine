//
//  VendingMachineData.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 18..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

struct VendingMachineData {
    private (set) var stock: [Beverage]
    private (set) var sortedStockList = [Beverage:Int]()
    private (set) var balance: Int
    
    init(stock: [Beverage]) {
        self.stock = stock
        self.balance = 0
        for item in stock {
            self.makeBeverageList(item)
        }
    }
    
    private mutating func makeBeverageList(_ item: Beverage) {
        if sortedStockList[item] != nil {
            sortedStockList[item]! += 1
        } else {
            sortedStockList[item] = 1
        }
    }
    
    init(stock: [Beverage], stockList: [Beverage:Int], balance: Int) {
        self.stock = stock
        self.sortedStockList = stockList
        self.balance = balance
    }
    
    init(stock: [Beverage], stockList: [Beverage:Int]) {
        self.init(stock: stock, stockList: stockList, balance: 0)
    }
    
}
