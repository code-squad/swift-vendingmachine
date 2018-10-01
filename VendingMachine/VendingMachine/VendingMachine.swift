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
    
    public func addStock(with addBeverages : [Beverage]) -> [Beverage] {
        /*
         1. 기존 리스트에 있는 음료
         self.beverages [[Beverage]] 안에 있는 [Beverage]에 값을 추가 할 수 없어서
         새로운 [Beverage]에 기존 [Beverage] 와 추가되는 [Beverage] 를 합쳐서
         self.beverages[index]의 값을 바꿔주는 형식으로 작성하였습니다.
         2. 새로운 음료
         (1)번의 리스트에서 매칭되는 것이 없다면 새로 추가합니다.
         */
        
        // 1
        for index in 0..<self.beverages.count {
            if self.beverages[index][0].className == addBeverages[0].className {
                var newBeverage = self.beverages[index]
                for addBeverage in addBeverages {
                    newBeverage.append(addBeverage)
                }
                self.beverages[index] = newBeverage
                return newBeverage
            }
        }

        // 2
        self.beverages.append(addBeverages)
        return addBeverages
    }
    
    public func removeStock(target : Int , amount : Int) -> [Beverage] {
        let index = target - 1
        var beverages = [Beverage]()
        for _ in 1...amount {
            beverages.append(self.beverages[index].removeFirst())
        }
        
        // 2차원 배열에서 빈배열의 경우 없애주기 위한 작업
        self.beverages = self.beverages.filter({$0.count > 0})
        
        return beverages
    }
    
    public func expiredBeverages() throws -> [[Beverage]] {
        // 출력
        // 유통기한 지난 음료 리스트
        guard let stockList = self.stockList() else { throw MachineError.outOfStock }
        
        var expiredBeverages = [[Beverage]]()
        var addIndex = 0
        for index in 0..<stockList.count {
            if let beverages = expiredBeverage(with: stockList[index]) {
                expiredBeverages.append(beverages)
                addIndex += 1
            }
        }
        
        guard expiredBeverages.count > 0 else { throw MachineError.outOfExpiredStock }
        return expiredBeverages
    }
    
    private func expiredBeverage(with beverages : [Beverage]) -> [Beverage]? {
        let today = Date(timeIntervalSinceNow: 0)
        var expiredBeverages = [Beverage]()
        for index in 0..<beverages.count {
            if beverages[index].isExpirationDate(with: today) {
                expiredBeverages.append(beverages[index])
            }
        }
        return expiredBeverages.count == 0 ? nil : expiredBeverages
    }
}
