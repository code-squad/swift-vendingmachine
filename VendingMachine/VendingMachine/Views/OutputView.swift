//
//  OutputView.swift
//  VendingMachine
//
//  Created by CHOMINJI on 17/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {
    static let balanceForm: (Int) -> Void = { balance in
        print("🤑 현재 투입한 금액: \(balance)원 🤑")
        print("🥤 음료 목록 🥤")
    }
    
    static let beverageListForm: ([(name: String, price: Int, value: Int)]) -> Void = { beverage in
        beverage.enumerated().forEach { number, beverage in
            print("\(number+1) - \(beverage.name) \(beverage.price)원 \(beverage.value)개")
        }
        print("🥤🥤🥤🥤🥤🥤\n")
    }
    
    static let purchaseForm: (String, Int) -> Void = { name, price in
        print("====== \(name) 구매! \(price)원을 차감합니다 💸 ======")
    }
}
