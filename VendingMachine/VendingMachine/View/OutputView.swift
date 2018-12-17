//
//  OutputView.swift
//  VendingMachine
//
//  Created by 윤지영 on 14/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

struct OutputView {
    private static let escape = "\u{001B}["
    private static let clear = "\(escape)2J"
    private static let home = "\(escape)0;0H"
    private static let menu = MenuItem.allCases
        .map { "\($0.rawValue). \($0.message)" }
        .joined(separator: "\n")

    private static let balanceForm: (Int) -> Void = { (balance: Int) in
        print("💰 현재 잔액은 \(balance)원입니다.")
    }

    private static let allListForm: (String, Int, Bool) -> Void = { (name: String, stock: Int, buyable: Bool) in
        let mark = buyable ? "✅" : "🚫"
        print("\(mark) \(name)(\(stock)개)")
    }

    private static let buyableListForm: (Bool, Int, String) -> Void = { (last: Bool, index: Int, name: String) in
        let branch = last ? "┗" : "┣"
        print("   \(branch) \(index). \(name)")
    }

    static func start(_ vendingMachine: VendingMachine) throws {
        if vendingMachine.isEmpty() { throw VendingMachineError.outOfStock }
        vendingMachine.showBalance(with: balanceForm)
        print("----------전체음료목록----------")
        vendingMachine.showListOfAll(with: allListForm)
        print("----------------------------")
        print(menu)
        vendingMachine.showListOfBuyable(with: buyableListForm)
    }

    static func showInsertion(of money: Int) {
        print("\(clear)\(home)")
        print("☑️ \(money)원을 투입하셨습니다.")
    }

    private static let purchaseForm: (String, Int) -> Void = { (name: String, price: Int) in
        print("\(clear)\(home)")
        print("☑️ \(name)를 구매하셨습니다. \(price)원을 차감합니다. 💸")
    }

    static func showPurchase(of beverage: Beverage) {
        beverage.showPurchase(with: purchaseForm)
    }

    static func showMessage(of error: MessagePrintable) {
        print("\(clear)\(home)")
        print(error.message)
    }

}

protocol MessagePrintable {
    var message: String { get }
}
