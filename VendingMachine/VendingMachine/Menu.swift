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
    
    public static func select(type : Int , with element : Int) throws {
        let customer = Customer.shared
        let inventory = Inventory.shared
        
        switch type {
        case 1:
            customer.charge(with: element)
        case 2:
            // 1. 판단 : 잔돈 >= 음료금액
            // 2. 처리 : 잔액차감 , 음료재고차감
            let isBalanceRemain = inventory.isAvailablePurchase(target: element, balance: customer.presentBalance())
            guard isBalanceRemain else { throw MachineError.lackBalance }
                let beverage = inventory.remove(target: element)
                customer.remove(with: beverage.beveragePrice())
                OutputView.printPurchase(with: beverage)
        default:
            throw InputError.rangeExceed
        }
    }
}
