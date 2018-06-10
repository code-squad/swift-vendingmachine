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
    private var beverageStock: BeverageStock = BeverageStock()
    
    mutating func insertMoney(_ money: Int) {
        self.insertedMoney += money
    }
    
    mutating func addBeverageStock(_ beverage: Beverage) {
        self.beverageStock.add(beverage)
    }
    
    func buyableBeveragesList() -> [Beverage] {
        return beverageStock.buyableBeverages(in: self.insertedMoney)
    }
}

struct BeverageStock {
    typealias BeverageType = String
    
    private var beverageStock: [BeverageType:BeverageList] = [BeverageType:BeverageList]()
    
    mutating func add(_ beverage: Beverage) {
        let beverageType: BeverageType = BeverageType(beverage.description.split(separator: ",")[0])
        if var beverageStock = self.beverageStock[beverageType] {
            beverageStock.addBeverage(beverage)
        } else {
            var beverageList: BeverageList = BeverageList()
            beverageList.addBeverage(beverage)
            self.beverageStock[beverageType] = beverageList
        }
    }
    
    func buyableBeverages(in price: Int) -> BeverageList {
        var beverageList = beverageList()
        
        for (_, value) in beverageStock {
            beverageList += value.buyableBeverages(in: price)
        }
        return beverageList
    }
}

struct BeverageList {
    
    private var beverageList: [Beverage] = [Beverage]()
    
    var isEmpty: Bool {
        return beverageList.count == 0
    }
    
    mutating func addBeverage(_ beverage: Beverage) {
        self.beverageList.append(beverage)
    }
    
    func buyableBeverages(in price: Int) -> BeverageList {
        return beverageList.filter { !$0.isExpensive(than: price) }
    }
}
