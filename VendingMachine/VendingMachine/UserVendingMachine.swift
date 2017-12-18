//
//  UserVendingMachine.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 18..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

protocol VendingMachineGetInfo {
    func getBalance() -> Int
    func getStockList() -> [Beverage:Int]
}

protocol VendingMachineExecute {
    mutating func insertMoney(_ money: Int)
    mutating func buyBeverage(number: Int) throws -> Beverage
}

struct UserVendingMachine:VendingMachineGetInfo, VendingMachineExecute {
    private var recepit = [String]()
    private (set) var stock: [Beverage]
    private var sortedStockList: [Beverage:Int]
    private var balance: Int
    
    init(stock: [Beverage], stockList: [Beverage:Int], balance: Int) {
        self.stock = stock
        self.sortedStockList = stockList
        self.balance = balance
    }
    
    mutating func insertMoney(_ money: Int) {
        balance += money
    }
    
    func getBalance() -> Int {
        return balance
    }
    
    mutating func buyBeverage(number: Int) throws -> Beverage {
        let item = sortedStockList[sortedStockList.index(sortedStockList.startIndex, offsetBy: number - 1)].key
        return try buyBeverage(item)
    }
    
    mutating func buyBeverage(_ selectedValue: Beverage) throws -> Beverage {
        guard let item = stock.index(where: { $0.name == selectedValue.name }) else {
            throw ErrorCode.noStock
        }
        guard selectedValue.checkAvailableList(with: balance) else {
            throw ErrorCode.noMoney
        }
        sortedStockList[selectedValue]! -= 1
        recepit.append(selectedValue.description)
        balance -= selectedValue.price
        return stock.remove(at: item)
    }
    
    func getStockList() -> [Beverage:Int] {
        return sortedStockList
    }
    
    func getValidBuyingBeverage() -> [Beverage] {
        let keys = sortedStockList.keys.map{ $0 }
        return keys.filter{ $0.checkAvailableList(with: balance) }
    }
    
    func getHotBeverage() -> [BeverageCheck] {
        let keys = sortedStockList.keys.map{ $0 }.flatMap{ $0 as? BeverageCheck }
        return keys.filter{ $0.isHot() }
    }
    
    func getRecepit() -> [String] {
        return recepit
    }
    
    func endUserMode() -> VendingMachineData {
        return VendingMachineData(stock: stock, stockList: sortedStockList, balance: balance)
    }
}
