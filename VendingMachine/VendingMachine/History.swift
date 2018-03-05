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
        var title = ""
        var log = ""
        if purchaseLog.count != 0 {
            title = "< 구매 내역 > \n"
            log = purchaseLog.map( {"\($0.type), \($0.getPrice())원, \((Date().getDateWithLocalTime()))"} ).joined(separator: "\n")
        } else {
            title = " >> 구매 내역이 없습니다. \n"
        }
        if supplyLog.count != 0 {
            title += "\n< 입고 내역 > \n"
            log = supplyLog.map( {"\($0.type), \($0.getPrice())원, \((Date().getDateWithLocalTime()))"} ).joined(separator: "\n")
        } else {
            title += " >> 입고 내역이 없습니다. \n"
        }
        return title+log
    }

}
