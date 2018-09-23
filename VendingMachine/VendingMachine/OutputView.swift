//
//  OutputView.swift
//  VendingMachine
//
//  Created by oingbong on 2018. 9. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct OutputView {
    public static func printInventoryList(with beverages: [[Beverage]]) {
        var result = ""
        for index in 0..<beverages.count {
            result += ("\(index+1)) \(beverages[index][0].description) (\(beverages[index].count)개)\n")
        }
        print("다음과 같은 음료가 있습니다.")
        print(result)
    }
    
    public static func printPresentBalance(with balance: Int) {
        print("현재 투입한 금액이 \(balance)원 입니다.")
    }
}
