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

    private static let balanceForm: (Int) -> Void = { (balance: Int) in
        print("💰 현재 투입한 금액은 \(balance)원입니다.")
    }

    private static let allListForm: (String, Int, Bool) -> Void = { (name: String, stock: Int, buyable: Bool) in
        let mark = buyable ? "✅" : "🚫"
        print("\(mark) \(name)(\(stock)개)")
    }

    private static let buyableListForm: (Bool, Int, String) -> Void = { (last: Bool, index: Int, name: String) in
        let branch = last ? "┗" : "┣"
        print("   \(branch) \(index). \(name)")
    }

    static func start(_ vendingMachine: VendingMachine) {
        vendingMachine.showBalance(with: balanceForm)
        print("----------전체음료목록----------")
        vendingMachine.showListOfAll(with: allListForm)
        print("----------------------------")
        print(menu)
        vendingMachine.showListOfBuyable(with: buyableListForm)
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
