//
//  StateType.swift
//  VendingMachine
//
//  Created by hw on 10/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum StateType: Int {
    case initialize = 9
    case ready = 0
    case chargeMoney = 1
    case sell = 2
    init(value: Int) {
        switch (value) {
        case 9:
            self = .initialize
        case 0:
            self = .ready
        case 1:
            self = .chargeMoney
        case 2:
            self = .sell
        default:
            self = .ready
        }
    }
    var description: String {
        switch self {
        case .chargeMoney:
            return "1. 금액추가"
        case .sell:
            return "2. 음료구매"
        default:
            return ""
        }
    }
}
