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
        let balanceMent = "현재 투입한 금액이 \(vendingMachineInfo.checkBalance())원입니다. 다음과 같은 음료가 있습니다.\n"
        
        var productList = ""
        let buyableList = Array(vendingMachineInfo.buyableProductList().values)

        if buyableList.count > 0 {
            for index in buyableList.startIndex..<buyableList.endIndex {
                productList += "\(index + 1))\(buyableList[index])\n"
            }
        } else {
            productList += "=>"
            for (name, count) in vendingMachineInfo.checkInventory() {
                productList += " \(name)(\(count)개)"
            }
            productList += "\n"
        }
        
        let selectMent = "1. 금액추가\n2. 음료구매\n> "
        let ment = balanceMent + productList + selectMent
        return ment
    }
}
