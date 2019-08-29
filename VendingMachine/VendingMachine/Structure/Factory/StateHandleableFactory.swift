//
//  StrategyGenerator.swift
//  VendingMachine
//
//  Created by 이동영 on 22/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct StateHandleableFactory {
    static func create(_ request: Request) -> StateHandleable {
        switch request {
        case .insert(amount: let value):
            let money = Money(value: value)
            return MoneyInsertStrategy(moneyToAdd: money,
                                       completion: OutputView.showInsertMoney)
        case .purchase(index: let value):
            let index = value - 1 
            return PurchaseStrategy(productToPurchaseIndex: index,
                                    completion: OutputView.showPurchase)
        }
    }
}
