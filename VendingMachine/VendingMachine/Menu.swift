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
    
    public static func select(type : Int , with : Int) {
        switch type {
        case 1:
            let customer = Customer.sharedBalance
            customer.charge(with: with)
        case 2:
            print("음료 구매, 재고 상태 변경!")
        default:
            print(InputError.inputRangeExceeded)
        }
    }
}
