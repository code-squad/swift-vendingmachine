//
//  Stock.swift
//  VendingMachine
//
//  Created by oingbong on 27/09/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct Stock {
    // 재고 준비
    public static func prepareStock() -> [[Beverage]] {
        var beverages = [[Beverage]]()
        let numberOfBeverageType = Int.random(in: 4...8)
        for _ in 1...numberOfBeverageType {
            let numberPerItem = Int.random(in: 1...9)
            let beverage = RandomBeverage.random(select: numberPerItem)
            // 음료 중복 확인
            var isDuplicate = false
            for savedItem in beverages {
                if beverage[0].className == savedItem[0].className {
                    isDuplicate = true
                    break
                }
            }
            if isDuplicate { continue }
            beverages.append(beverage)
        }
        
        return beverages
    }
}
