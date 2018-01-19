//
//  InputView.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 19..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {
    private var vendingMachine: VendingMachine
    private let allMenus = BeverageMenu.allValues
    
    init(vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
    }
    
    func chooseAction() throws -> (Mode, Int)? {
        print(getCurrentState())
        
        guard let answer = readLine() else { throw BeverageErrors.invalidValue }
        
        return try act(answer)
    }
    
    func act(_ action: String) throws -> (Mode, Int)? {
        let arguments = action.split(separator: " ")
        
        if arguments[0] == "q" || arguments[0] == "quit" { return nil }
        guard arguments.count >= 2 else { throw BeverageErrors.invalidValue }
        guard let mode = Mode(rawValue: Int(arguments[0]) ?? 0) else { throw BeverageErrors.invalidValue }
        
        return (mode, Int(arguments[1]) ?? 0)
    }
}

extension InputView {
    enum Mode: Int, CustomStringConvertible {
        case insertMoney = 1
        case buyBeverage
        
        var description: String {
            switch self {
            case .insertMoney:
                return "금액추가"
            case .buyBeverage:
                return "음료구매"
            }
        }
    }
    
    private func getCurrentState() -> String {
        return """
        현재 투입한 금액이 \(vendingMachine.countChange())원입니다. 다음과 같은 음료가 있습니다.
        \(vendingMachine.countChange() == 0 ? viewCurrentInventory() : viewListOfCurrentBeverage())
        1. \(Mode.insertMoney.description)
        2. \(Mode.buyBeverage.description)
        """
    }
    
    private func viewCurrentInventory() -> String {
        return vendingMachine.checkCurrentInventory().reduce("=> ") {
            $0 + $1.beverageMenu.makeInstance().description + "(" + String($1.quantity) + "개) "
        }
    }
    
    private func viewListOfCurrentBeverage() -> String {
        var number = 0
        return allMenus.map({
            let beverage = $0.makeInstance()
            number = number + 1
            return String(number) + ") " + beverage.description + " " + String(beverage.price) + "원(" +  String(vendingMachine.countBeverageQuantity(beverageMenu: $0)) + "개)"
        }).joined(separator: "\n")
    }
}
