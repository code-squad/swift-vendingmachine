//
//  UserMode.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 20..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class UserMode<MachineType: UserServable>: ActivateMode {
    private let machine: MachineType
    init(_ machine: MachineType) {
        self.machine = machine
    }

    // 사용자 메뉴 종류.
    enum Modes: Int, CustomStringConvertible, EnumCollection {
        case insert = 1
        case buy
        case restart
        var description: String {
            var menuName = ""
            switch self {
            case .insert: menuName = "금액추가 (예: 1 (100 | 500 | 1000))"
            case .buy: menuName = "음료구매 (예: 2 5(메뉴번호))"
            case .restart: menuName = "모드재선택"
            }
            return String(rawValue) + ". " + menuName
        }
    }

    // 사용자 스크린 표시 및 사용자 입력값(1개 이상) 전처리 및 반환.
    func prompt() -> [Argument]? {
        print(showScreen(), terminator: "")
        let inputArguments = splitUserInput()
        guard inputArguments.count > 0 else { return nil }
        return inputArguments
    }

    // 각 메뉴에 따라 수행.
    func perform(_ arguments: [Argument]) -> String? {
        guard !isStockEmpty() else { return nil }
        guard let preprocessed = preprocessArguments(using: arguments) else { return nil }
        var result: String?
        switch preprocessed.mode {
        case .insert: result = performInsert(preprocessed.leftArgs)
        case .buy: result = performPurchase(preprocessed.leftArgs)
        case .restart: return nil
        }
        return result
    }
    
}

private extension UserMode {
    // 입력받은 인자 중에서 첫 번째 인자를 Modes 타입으로 변환.
    func preprocessArguments(using userInputs: [Argument]) -> (mode: Modes, leftArgs: [Argument])? {
        var userInputs = userInputs
        // 첫번째 인자를 Modes 타입 메뉴로 변환.
        guard let firstArg = userInputs.first, let userMode = Modes(rawValue: firstArg) else { return nil }
        userInputs.removeFirst()
        return (userMode, userInputs)
    }

    // 화폐 삽입 시 결과 표시.
    func performInsert(_ arguments: [Argument]) -> String? {
        guard let numberOfCoins = arguments.first, let insertedCoin = MoneyManager.Unit(rawValue: numberOfCoins) else { return nil }
        machine.insertMoney(insertedCoin)
        return "\n\(insertedCoin.rawValue)원이 삽입되었습니다."
    }

    // 음료 구입 시 결과 표시.
    func performPurchase(_ arguments: [Argument]) -> String? {
        guard let beverageMenuNumber = arguments.first else { return nil }
        // 메뉴 번호가 음료수 메뉴 범위 안에 있는 지 확인.
        guard 0 < beverageMenuNumber && beverageMenuNumber <= MachineType.MenuType.allValues.count else { return nil }
        let selectedMenu = MachineType.MenuType.allValues[beverageMenuNumber-1]
        guard let purchasedBeverage = machine.popBeverage(selectedMenu) else { return nil }
        return "\n\(purchasedBeverage.productName)를 구매하셨습니다. \(purchasedBeverage.price)원을 차감합니다."
    }

    // 사용자 스크린 표시.
    func showScreen() -> String {
        var screen = "\n===============================================\n"
        screen += "현재 투입한 금액이 \(machine.showBalance())원입니다.\n"
        if isStockEmpty() {
            screen += "재고가 하나도 없습니다. 관리자모드에서 재고를 먼저 추가해주세요.\n"
        }else {
            screen += "다음과 같은 음료가 있습니다.\n"
            screen += showMenus()
            for inputMenu in Modes.allValues {
                screen += "\n\(inputMenu.description)"
            }
            screen += "\n> "
        }
        return screen
    }

    // 모든 메뉴의 재고가 0개인 경우 true 반환.
    func isStockEmpty() -> Bool {
        let totalStockCount = machine.checkTheStock().values.reduce(0, +)
        return (totalStockCount == 0)
    }

    // 잔액에 따라 메뉴 포맷 달라짐.
    func showMenus() -> String {
        var screen = ""
        if machine.showBalance() == 0 {
            screen += showDefaultMenus()
        }else {
            screen += showMenusInOrder()
        }
        return screen
    }
    
    // 잔액이 0원인 경우, 디폴트 메뉴 표시.
    func showDefaultMenus() -> String {
        var screen = "=> "
        // 자판기 메뉴명, 재고만 표시.
        for (beverageType, stock) in machine.checkTheStock() {
            guard let product = MachineType.MenuType.allValues.filter({ $0 == beverageType }).first else { return "" }
            screen += "\(product.productName)(\(stock)개) "
        }
        screen += "\n"
        return screen
    }

    // 잔액이 있는 경우, 모든 메뉴를 순서대로 가격과 함께 표시.
    func showMenusInOrder() -> String {
        var screen = ""
        for menu in MachineType.MenuType.allValues {
            // 현재 메뉴의 재고.
            guard let stock = machine.checkTheStock().filter({ $0.key == menu })[menu] else { break }
            // 현재 메뉴의 번호, 이름, 가격, 재고 표시.
            screen += "\(menu.hashValue+1)) \(menu.productName) \(menu.price)원 (\(stock)개)\n"
        }
        return screen
    }
    
}
