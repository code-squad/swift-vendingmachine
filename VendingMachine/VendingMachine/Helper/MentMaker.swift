//
//  MentMaker.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 21..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct MentMaker {
    static func makeInputMent(vendingMachineInfo: VendingMachineInfo) -> String {
        var ment = "현재 투입한 금액이 \(vendingMachineInfo.checkBalance())원입니다. 다음과 같은 음료가 있습니다.\n"
        let buyableList = Array(vendingMachineInfo.buyableProductList().values)
        
        if buyableList.count > 0 {
            for index in buyableList.startIndex..<buyableList.endIndex {
                let readInfo = { (name: String, price: Int, beverageCount: Int) -> String in
                    return "\(index + 1))\(name) \(price)(\(beverageCount)개)\n"
                }
                ment += buyableList[index].info(read: readInfo)
            }
        } else {
            ment += "=>"
            for (name, count) in vendingMachineInfo.checkInventory() {
                ment += " \(name)(\(count)개)"
            }
            ment += "\n"
        }
        
        ment += "1. 금액추가\n2. 음료구매\n> "
        return ment
    }
}
