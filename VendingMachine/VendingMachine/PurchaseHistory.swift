//
//  PurchaseHistory.swift
//  VendingMachine
//
//  Created by 윤동민 on 07/01/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class PurchaseHistory {
    private var history: [Beverage] = []
    
    func addHistory(of drink: Beverage) {
        history.append(drink)
    }
    
    func convertToStrngHistory() -> [String] {
        var stringHistory: [String] = []
        for one in history { stringHistory.append(one.convertToStringBeverage()) }
        return stringHistory
    }
}
