//
//  History.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 2. 2..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct History {
    private var purchaseLog = [Beverage]()
    private var supplyLog =  [Beverage]()

    init(_ purchase: [Beverage], _ supply: [Beverage]) {
        self.purchaseLog = purchase
        self.supplyLog = supply
    }

    func showHistory() -> String {
        var result = ""

        if purchaseLog.count != 0 {
            result += " 구매 내역 > \n"
            for log in purchaseLog {
                result += "\(log.description), \(log.getPrice())원 \n"
            }
        } else {
            result += " >> 구매 내역이 없습니다. \n"
        }

        if supplyLog.count != 0 {
            result += " 입고 내역 > \n"
            for log in supplyLog {
                result += "\(log.description), \(log.getPrice())원 \n"
            }
        } else {
            result += " >> 입고 내역이 없습니다. \n"
        }
        return result
    }

}
