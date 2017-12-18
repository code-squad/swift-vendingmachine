//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 15..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

struct AdminVendingMachine {
    private (set) var stock: [Beverage]
    private var sortedStockList = [Beverage:Int]()
    
    init(stock: [Beverage]) {
        self.stock = stock
        for item in stock {
            makeBeverageList(item)
        }
    }
    
    private mutating func makeBeverageList(_ item: Beverage) {
        if sortedStockList[item] != nil {
            sortedStockList[item]! += 1
        } else {
            sortedStockList[item] = 1
        }
    }
    
    mutating func addBeverage(_ item: Beverage) {
        stock.append(item)
        makeBeverageList(item)
    }
    
    mutating func removeBeverage(_ item: Beverage) throws {
        guard let index = stock.index(where: { $0.name == item.name }) else {
            throw ErrorCode.noStock
        }
        stock.remove(at: index)
    }
    
    func getPassedValidateBeverage() -> [BeverageCheck] {
        let checkingStock = stock.flatMap{ $0 as? BeverageCheck }
        return checkingStock.filter{ !$0.validate(with: Date()) }
    }
    
    func endAdminMode() -> VendingMachineData {
        return VendingMachineData(stock: stock, stockList: sortedStockList)
    }
    
}
