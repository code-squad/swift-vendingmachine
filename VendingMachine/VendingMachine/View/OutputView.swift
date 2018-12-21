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
    static let clear = {
        print("\(escape)2J\(escape)0;0H")
    }
    private static let mode = ExecutionMode.allCases
        .map { "\($0.rawValue). \($0.name)" }.listed()
    private static let managerMenu = ManagerMenuItem.allCases
        .map { "\($0.rawValue). \($0.message)" }.listed()
    private static let consumerMenu = ConsumerMenuItem.allCases
        .map { "\($0.rawValue). \($0.message)" }.listed()

    static func selectMode() {
        clear()
        print("자판기를 시작합니다.\n종료키워드: q 또는 quit\n")
        print(mode)
    }

    /*
     Methods belows show VendingMachine of ManagerMode
    */
    static func start(_ vendingMachine: PrintableForManager) {
        print("\n----------전체음료목록----------")
        vendingMachine.showListOfAll(with: allListForm)
        print("----------------------------")
        print(managerMenu)
    }

    private static let historyForm = { (order: Int, purchase: String) in
        print("\(order)) \(purchase)")
    }

    static func askValue(of menu: ManagerMenuItem) {
        switch menu {
        case .addBeverage: print("\n추가할 음료 번호를 입력해주세요.")
        case .removeBeverage: print("\n제거할 음료 번호를 입력해주세요.")
        default: return
        }
    }

    static func showListRemoved(beverages: [Beverage]) {
        let listRemoved = beverages
            .map { "\($0.title)" }.listed()
        clear()
        print("---------제거된 음료목록---------")
        print("\(listRemoved)\n")
    }

    static func showHistory(of vendingMachine: PrintableForManager) {
        clear()
        guard vendingMachine.hasHistory() else {
            print("구매이력이 존재하지 않습니다.")
            return
        }
        print("---------소비자 구매이력---------")
        vendingMachine.showHistory(with: historyForm)
    }

    static func showAddition(of beverage: Int) {
        clear()
        print("\(beverage + 1)번 음료가 추가되었습니다.\n")
    }

    static func showRemoval(of beverage: Beverage) {
        clear()
        print("\(beverage.title)가 제거되었습니다.\n")
    }

    /*
     Methods belows show VendingMachine of ConsumerMode
     */
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
        print("\n----------전체음료목록----------")
        vendingMachine.showListOfAllMarked(with: allListForm)
        print("----------------------------")
        print(consumerMenu)
        vendingMachine.showListOfBuyable(with: buyableListForm)
    }

    static func showInsertion(of money: Int) {
        clear()
        print("☑️ \(money)원을 투입하셨습니다.")
    }

    private static let purchaseForm = { (name: String, price: Int) in
        clear()
        print("☑️ \(name)를 구매하셨습니다. \(price)원을 차감합니다. 💸")
    }

    static func showPurchase(of beverage: Beverage) {
        beverage.showPurchase(with: purchaseForm)
    }

    /*
     Show messages or descriptions of error ocurred
     */
    static func showMessage(of error: MessagePrintable) {
        clear()
        print("\(error.message)\n")
    }

    static func showUnexpected(error: Error) {
        print("Unexpected error: \(error).")
    }

}

protocol MessagePrintable {
    var message: String { get }
}

extension Array where Element == String {

    func listed() -> String {
        return self.joined(separator: "\n")
    }

}
