//
//  UserMenu.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol Menu: CustomStringConvertible {
    
}

enum UserMenu: Int, CaseIterable {
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
