//
//  Menu.swift
//  VendingMachine
//
//  Created by CHOMINJI on 22/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Menu: Int, CaseIterable, CustomStringConvertible {
    case insertMoney = 1
    case purchaseBeverage
    
    var description: String {
        switch self {
        case .insertMoney:
            return "\(rawValue). 금액 추가"
        case .purchaseBeverage:
            return "\(rawValue). 음료 구매"
        }
    }
}
