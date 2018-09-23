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
    
    var description: String {
        switch self {
        case .addBalance: return "금액추가"
        case .purchaseBeverage: return "음료구매"
        }
    }
}
