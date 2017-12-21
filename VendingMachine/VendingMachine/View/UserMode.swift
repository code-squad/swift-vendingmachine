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
    private var selectedMode: Modes
    private var valueForMode: Int
    init(_ machine: MachineType) {
        self.machine = machine
        self.selectedMode = .insert
        self.valueForMode = 0
    }

    // 사용자 메뉴 종류.
    enum Modes: Int, CustomStringConvertible, EnumCollection {
        case insert = 1
        case buy
        var description: String {
            var menuName = ""
            switch self {
            case .insert: menuName = "금액추가"
            case .buy: menuName = "음료구매"
            }
            return String(rawValue) + ". " + menuName
        }
    }

    // 사용자 스크린 표시 및 사용자 입력값(2개) 전처리 및 반환.
    func prompt() {
        print(showScreen(), terminator: "")
        guard let userInputs = splitUserInput() else { return }
        guard let selectedMenu = Modes(rawValue: userInputs.firstArg) else { return }
        self.selectedMode = selectedMenu
        self.valueForMode = userInputs.secondArg
    }

    // 각 메뉴에 따라 수행.
    func perform() {
        switch selectedMode {
        case .insert: performInsert(valueForMode)
        case .buy: performPurchase(valueForMode)
        }
    }
    
}

private extension UserMode {
    // 화폐 삽입 시 결과 표시.
    func performInsert(_ userInput: Int) {
        guard let insertedCoin = MoneyManager.Unit(rawValue: userInput) else { return }
        machine.insertMoney(insertedCoin)
    }

    // 음료 구입 시 결과 표시.
    func performPurchase(_ userInput: Int) {
        guard 0 < userInput && userInput <= MachineType.MenuType.allValues.count else { return }
        let selectedMenu = MachineType.MenuType.allValues[userInput-1]
        guard let purchasedBeverage = machine.popBeverage(selectedMenu) else { return }
        print("\(purchasedBeverage.productName) 음료를 구매하셨습니다. \(purchasedBeverage.price)원을 차감합니다.")
    }

    // 사용자 입력 문자열을 2개의 인자로 분리 및 숫자 변환.
    func splitUserInput() -> (firstArg: Int, secondArg: Int)? {
        guard let userInput = readLine(), userInput != "q" || userInput != "quit" else { return nil }
        let userInputs = userInput.split(separator: " ")
        guard userInputs.count >= 2 else { return nil }
        guard let firstInput = userInputs.first, let secondInput = userInputs.last else { return nil }
        guard let userArgument1 = Int(firstInput), let userArgument2 = Int(secondInput) else { return nil }
        return (userArgument1, userArgument2)
    }

    // 사용자 스크린 표시.
    func showScreen() -> String {
        var screen = "\n현재 투입한 금액이 \(machine.showBalance())원입니다. 다음과 같은 음료가 있습니다.\n "
        screen += showMenus()
        for inputMenu in Modes.allValues {
            screen += "\n\(inputMenu.description)"
        }
        screen += "\n> "
        return screen
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
