//
//  Menu.swift
//  VendingMachine
//
//  Created by oingbong on 2018. 9. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

enum Menu : Int, CaseIterable , CustomStringConvertible {
    case addBalance
    case purchaseBeverage
    case historyList
    
    var description: String {
        switch self {
        case .addBalance: return "금액추가"
        case .purchaseBeverage: return "음료구매"
        case .historyList: return "구매내역"
        }
    }
    
    public static func select(with type : Int ) throws -> Menu {
        switch type {
        case 1: return Menu.addBalance
        case 2: return Menu.purchaseBeverage
        case 3: return Menu.historyList
        default: throw InputError.rangeExceed
        }
    }
}
