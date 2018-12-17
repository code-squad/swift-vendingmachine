//
//  OutputView.swift
//  VendingMachine
//
//  Created by 윤지영 on 14/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct OutputView {
    private static let menu = MenuItem.allCases
        .map { "\($0.rawValue). \($0.message)" }
        .joined(separator: "\n")
    
    private static let listForm: (String, Int) -> Void = { (name: String, stock: Int) in
        print("\(name)(\(stock)개)", separator: " ")
    }

    private static let balanceForm: (Int) -> Void = { (balance: Int) in
        print("현재 투입한 금액은 \(balance)입니다.")
    }

    static func start(_ vendingMachine: VendingMachine) {
        vendingMachine.showBalance(with: balanceForm)
        print("--------음료목록--------")
        vendingMachine.showListOfAll(with: listForm)
        print("----------------------")
        print(menu)
    }
}

enum MenuItem: Int, CaseIterable {
    case insertCoin = 1, purchaseBeverage
    
    var message: String{
        switch self {
        case .insertCoin:
            return "금액추가"
        case .purchaseBeverage:
            return "음료구매"
        }
    }
}
