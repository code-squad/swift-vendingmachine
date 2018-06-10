//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by moon on 2018. 6. 9..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    
    private var insertedMoney: Int = 0
    private var beverageStock: BeverageList = BeverageList()
    
    var isStockEmpty: Bool {
        return self.beverageStock.isEmpty
    }
    
    mutating func insertMoney(_ money: Int) {
        self.insertedMoney += money
    }
    
    mutating func addBeverageStock(_ beverage: Beverage) {
        self.beverageStock.addBeverage(beverage)
    }
    
    func buyableBeveragesList() -> [Beverage] {
        return beverageStock.buyableBeverages(in: self.insertedMoney)
    }
}

struct BeverageStock {
    typealias BeverageType = String
    
    private var beverageStock: [BeverageType:BeverageList] = [BeverageType:BeverageList]()
}

struct BeverageList {
    
    private var beverageList: [Beverage] = [Beverage]()
    
    var isEmpty: Bool {
        return beverageList.count == 0
    }
    
    mutating func addBeverage(_ beverage: Beverage) {
        self.beverageList.append(beverage)
    }
    
    func buyableBeverages(in price: Int) -> [Beverage] {
        return beverageList.filter { !$0.isExpensive(than: price) }
    }
}
