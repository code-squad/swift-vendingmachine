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
    private static let mode = ExecutionMode.allCases
        .map { "\($0.rawValue). \($0.name)" }.listed()
    private static let managerMenu = ManagerMenuItem.allCases
        .map { "\($0.rawValue). \($0.message)" }.listed()
    private static let consumerMenu = ConsumerMenuItem.allCases
        .map { "\($0.rawValue). \($0.message)" }.listed()

    static func selectMode() {
        print("자판기를 시작합니다.")
        print(mode)
    }

    static func start(_ vendingMachine: PrintableForManager) {
        print("----------전체음료목록----------")
        vendingMachine.showListOfAll(with: allListForm)
        print("----------------------------")
        print(managerMenu)
    }

    private static let balanceForm = { (balance: Int) in
        print("💰 현재 잔액은 \(balance)원입니다.")
    }

    private static let allListForm = { (name: String, stock: Int, check: Bool) in
        let mark = check ? "✅" : "🚫"
        print("\(mark) \(name)(\(stock)개)")
    }

    private static let buyableListForm = { (last: Bool, index: Int, name: String) in
        let branch = last ? "┗" : "┣"
        print("   \(branch) \(index). \(name)")
    }

    static func start(_ vendingMachine: PrintableForConsumer) {
        vendingMachine.showBalance(with: balanceForm)
        print("----------전체음료목록----------")
        vendingMachine.showListOfAllMarked(with: allListForm)
        print("----------------------------")
        print(consumerMenu)
        vendingMachine.showListOfBuyable(with: buyableListForm)
    }

    static func showInsertion(of money: Int) {
        print("\(clear)\(home)")
        print("☑️ \(money)원을 투입하셨습니다.")
    }

    private static let purchaseForm = { (name: String, price: Int) in
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

extension Array where Element == String{

    func listed() -> String {
        return self.joined(separator: "\n")
    }

}
