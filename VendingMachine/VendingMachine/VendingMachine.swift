//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by oingbong on 25/09/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct VendingMachine {
    public static func excute(with type : Menu) throws {
        let customer = Customer.shared
        let inventory = Inventory.shared
        let history = History.shared
        let element = InputView.element
        
        switch type {
        case .addBalance:
            customer.charge(with: element)
        case .purchaseBeverage:
            // 1. 판단 : 잔돈 >= 음료금액
            // 2. 처리 : 잔액차감 , 음료재고차감 , 구매내역 저장
            let isBalanceRemain = inventory.isAvailablePurchase(target: element, balance: customer.presentBalance())
            guard isBalanceRemain else { throw MachineError.lackBalance }
            let beverage = inventory.remove(target: element)
            customer.remove(with: beverage.beveragePrice())
            OutputView.printPurchase(with: beverage)
            history.add(with: beverage)
        case .historyList:
            let list = history.list()
            OutputView.printHistory(with: list)
        }
    }
}
