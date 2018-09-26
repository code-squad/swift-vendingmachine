//
//  Inventory.swift
//  VendingMachine
//
//  Created by oingbong on 2018. 9. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Inventory {
    static let shared = Inventory() // for Singleton
    
    private var beverages: [[Beverage]]?
    
    // 재고 추가
    public func stockUp(with beverages: [[Beverage]]) {
        self.beverages = beverages
    }
    
    public func list() -> [[Beverage]]? {
        return self.beverages
    }
    
    public func remove(target: Int) -> Beverage? {
        let index = target - 1
        let beverage = self.beverages?[index].removeFirst()
        
        // 2차원 배열에서 빈배열의 경우 없애주기 위한 작업
        self.beverages = self.beverages?.filter({$0.count > 0})

        return beverage
    }
    
    public func isAvailablePurchase(target: Int , balance: Int) throws -> Bool {
        guard let beverages = self.beverages else { throw MachineError.outOfStock }
        guard target <= beverages.count else { throw InputError.rangeExceed }
        let index = target - 1
        let result = beverages[index][0].isAvailablePurchase(with: balance)
        return result
    }
}
