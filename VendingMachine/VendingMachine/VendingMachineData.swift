//
//  VendingMachineData.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 18..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

struct VendingMachineData {
    private var stock: [Beverage]
    private var sortedStockList = [Beverage:Int]()
    private var balance: Int
    
    init(stock: [Beverage], stockList: [Beverage:Int], balance: Int) {
        self.stock = stock
        self.sortedStockList = stockList
        self.balance = balance
    }
    
    init(stock: [Beverage], stockList: [Beverage:Int]) {
        self.init(stock: stock, stockList: stockList, balance: 0)
    }
    
}
