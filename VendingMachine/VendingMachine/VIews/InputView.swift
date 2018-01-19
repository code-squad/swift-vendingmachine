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
    
    init(vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
    }
    
    func chooseAction() throws -> Mode{
        print(getCurrentState())
        
        guard let answer = readLine() else {
            throw BeverageErrors.invalidValue
        }
        
        return try act(answer)
    }
    
    func act(_ action: String) throws -> Mode {
        let arguments = action.split(separator: " ")
        
        guard arguments.count >= 2 else { throw BeverageErrors.invalidValue }
        guard let mode = Mode(rawValue: Int(arguments[0]) ?? 0) else { throw BeverageErrors.invalidValue }
        
        return mode
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
        \(viewCurrentInventory())
        1. \(Mode.insertMoney.description)
        2. \(Mode.buyBeverage.description)
        """
    }
    
    private func viewCurrentInventory() -> String {
        return vendingMachine.checkCurrentInventory().reduce("= >") {
            $0 + $1.beverageMenu.makeInstance().description + "(" + String($1.quantity) + "개) "
        }
    }
}
