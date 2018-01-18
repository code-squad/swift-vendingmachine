//
//  Money.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 18..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Money {
    private var money: Change
    
    init(_ money: Change) {
        self.money = money
    }
    
    mutating func insert(coin: Unit) {
        self.money += coin.rawValue
    }
    
    func countChange() -> Change {
        return self.money
    }
}

extension Money {
    enum Unit: Change {
        case hundred = 100
        case fiveHundred = 500
        case thousand = 1000
        case fiveThousand = 5000
        case tenThousand = 10000
    }
}
