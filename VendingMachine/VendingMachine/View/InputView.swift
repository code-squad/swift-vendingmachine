//
//  InputView.swift
//  VendingMachine
//
//  Created by 심 승민 on 2017. 12. 18..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class InputView {
    private let vendingMachine: VendingMachine
    init(_ vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
    }

    // 잔액이 0원인 경우, 디폴트 메뉴 표시.
    private func showDefaultMenus() -> String {
        var screen = "=> "
        // 자판기 메뉴명, 재고만 표시.
        for (beverageClassName, stock) in self.vendingMachine.checkTheStock() {
            let productName = VendingMachine.Menu.allValues.filter({ $0.description == beverageClassName })[0].rawValue
            screen += "\(productName)(\(stock)개) "
        }
        screen += "\n"
        return screen
    }

    // 잔액이 있는 경우, 모든 메뉴를 순서대로 가격과 함께 표시.
    private func showMenusInOrder() -> String {
        var screen = ""
        for menu in VendingMachine.Menu.allValues {
            // 현재 메뉴의 재고.
            guard let stock = self.vendingMachine.checkTheStock().filter({ $0.key == menu.description })[menu.description] else { break }
            // 현재 메뉴의 번호, 이름, 가격, 재고 표시.
            screen += "\(menu.hashValue+1)) \(menu.rawValue) \(menu.price)원 (\(stock)개)\n"
        }
        return screen
    }

    // 잔액에 따라 메뉴 포맷 달라짐.
    private func showMenus() -> String {
        var screen = ""
        if self.vendingMachine.showBalance() == 0 {
            screen += showDefaultMenus()
        }else {
            screen += showMenusInOrder()
        }
        return screen
    }

    // 사용자 스크린 표시.
    private func showScreen() {
        var screen = "\n현재 투입한 금액이 \(self.vendingMachine.showBalance())원입니다. 다음과 같은 음료가 있습니다.\n "
        screen += showMenus()
        for inputMenu in InputMenu.allValues {
            screen += "\n\(inputMenu.description)"
        }
        screen += "\n> "
        print(screen, terminator: "")
    }

    // 사용자 메뉴 종류.
    enum InputMenu: Int, CustomStringConvertible, EnumCollection {
        case insert = 1
        case buy
        var description: String {
            var menuName = ""
            switch self {
            case .insert: menuName = "금액추가"
            case .buy: menuName = "음료구매"
            }
            return String(self.rawValue) + ". " + menuName
        }
    }

    // 사용자 스크린 표시 및 사용자 입력값(2개) 전처리 및 반환.
    func prompt() -> (InputMenu, Int)? {
        showScreen()
        guard let userInput = readLine(), userInput != "q" || userInput != "quit" else { return nil }
        let userInputs = userInput.split(separator: " ")
        guard userInputs.count >= 2 else { return nil }
        guard let userInputArgument1 = Int(userInputs[0]), let userInputArgument2 = Int(userInputs[1]) else { return nil }
        guard let selectedMenu = InputMenu(rawValue: userInputArgument1) else { return nil }
        return (selectedMenu, userInputArgument2)
    }

}
