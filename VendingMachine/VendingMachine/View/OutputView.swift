//
//  OutputView.swift
//  VendingMachine
//
//  Created by Elena on 02/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct OutputView {

    private static let mode = UserMode.allCases.map { "\($0.rawValue). \($0.mode)" }.joined(separator: "\n")

    static func selectMode() {
        print("------------👤---모드 선택---👥------------")
        print(mode)
        print("\n----- 종료는 q 입력 후 enterkey 입력해주세요 -----")
    }

    static let allListForm: (String, Int, Bool) -> Void = { (name: String, goods: Int, buyable: Bool) in
        let mark = buyable ? "✅" : "🚫"
        print(" \(mark)  \(name)(\(goods)개)")
    }

    static let availableListForm = { (last: Bool, number: Int, name: String) in
        let mark = last ? "┗" : "┣"
        print(" \t \(mark) \(number). \(name)")
    }

    static func showMessage(error: MessagePrintable) {
        print(error.message)
    }
}

struct ManagerOutputView {

    private static let manager = ManagerMenuScript.allCases
        .map { "\($0.rawValue). \($0.managerMessage)" }.joined(separator: "\n")

    static func start(_ vendingMachine: VendingMachineShowManager) {
        print("---------- 🛠 전체 목록 🛠 --------------")
        vendingMachine.showListOfAllManager(list: OutputView.allListForm)
        print("---------------------------------------")
        print("\n----- 종료는 q 입력 후 enterkey 입력해주세요 -----")
        print(manager)
    }

    static func question(value: ManagerMenuScript) {
        switch value {
        case .addBeverage:
            print("🥤추가 번호를 입력해주세요.")
        case .removeBeverage:
            print("🥤제거 번호를 입력해주세요.")
        default:
            return
        }
    }

    static func showListRemoved(beverages: [Beverage]) {
        let list = beverages.map { "\($0.title)"}.joined(separator: "\n")
        print("---------제거 목록---------")
        print("\(list)\n")
    }

    static func showRemoveMsg(beverage: Beverage) {
        print("\(beverage.title) 제거되었습니다.\n")
    }

    static func showAddMsg(beverage: Int) {
        print("\(beverage + 1)번 음료 추가되었습니다.\n")
    }
}

struct CustomerOutputView {

    private static let customer = CustomerMenuScript.allCases
        .map { "\($0.rawValue). \($0.customerMessage)" }.joined(separator: "\n")

    private static let moneyForm = { (money: Int) in
        print("  💵 현재 잔액은 \(money.commaRepresentation)원")
    }

    static let moneyRetrunForm = { (money: Int) in
        print("  💵 잔액은 \(money.commaRepresentation)원 딸깍딸깍~Bye 👋🏻 ")
    }

    private static let purchaseForm = { (name: String, price: Int) in
        print(" ☛ \(name)를 구매하셨습니다. \(price.commaRepresentation)원을 차감합니다. ")
    }

    static func moneyReturn(_ vendingMachine: VendingMachine) {
        vendingMachine.showList(show: moneyRetrunForm)
    }

    static func start(_ vendingMachine: VendingMachineShowCustomer) {

        vendingMachine.showList(show: moneyForm)
        print("----------🥤전체 음료 목록🥤--------------")
        vendingMachine.showListOfAll(list: OutputView.allListForm)
        print("---------------------------------------")
        print("\n----- 종료는 q 입력 후 enterkey 입력해주세요 -----")
        print(customer)
        vendingMachine.showListOfBuyable(list: OutputView.availableListForm)
    }

    static func showInsertion(money: Int) {
        print(" ☛ 투입 금액이 \(money.commaRepresentation)원 입니다.")
    }

    static func showPurchase(beverage: Beverage) {
        beverage.doPurchase(goods: purchaseForm)
    }

    static func showMessage(error: MessagePrintable) {
        print(error.message)
    }

}

extension Int {
    // , 를 위해 구현
    private static var commaFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    var commaRepresentation: String {
        return Int.commaFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
