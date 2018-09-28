//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by oingbong on 25/09/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class VendingMachine {
    private var beverages: [[Beverage]]
    private var cash = Cash()
    private var history = History()
    
    init(with beverages: [[Beverage]]) {
        self.beverages = beverages
    }
    
    // 재고 추가
    public func stockUp(with beverages: [[Beverage]]) {
        self.beverages = beverages
    }
    
    public func stockList() -> [[Beverage]]? {
        return self.beverages
    }
    
    public func remove(target: Int) -> Beverage? {
        let index = target - 1
        let beverage = self.beverages[index].removeFirst()
        
        self.cash.remove(with: beverage.beveragePrice())
        self.history.add(with: beverage)
        
        // 2차원 배열에서 빈배열의 경우 없애주기 위한 작업
        self.beverages = self.beverages.filter({$0.count > 0})
        
        return beverage
    }
    
    public func addBalance(value : Int) {
        self.cash.addBalance(with: value)
    }
    
    public func presentBalance() -> Int {
        return self.cash.presentBalance()
    }
    
    public func historyList() -> [Beverage] {
        return self.history.list()
    }
    
    public func isAvailablePurchase(target: Int , balance: Int) throws -> Bool {
        guard target <= self.beverages.count else { throw InputError.rangeExceed }
        let index = target - 1
        let result = beverages[index][0].isAvailablePurchase(with: balance)
        return result
    }
}
