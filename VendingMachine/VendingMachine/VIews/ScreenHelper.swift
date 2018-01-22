//
//  ViewHelper.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct ScreenHelper {
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
    
    func makeInputViewMessage(machine: Userable & MachineManagerable) -> String {
        let currentChange = viewCurrentChange(machine)
        return """
        현재 투입한 금액이 \(currentChange)원입니다. 다음과 같은 음료가 있습니다.
        \(currentChange == 0 ? viewCurrentInventory(machine) : viewListOfCurrentBeverage(machine))
        1. \(Mode.insertMoney.description)
        2. \(Mode.buyBeverage.description)
        """
    }
    
    private func viewCurrentChange(_ machine: Userable) -> Int {
        return machine.countChange()
    }
    
    private func viewCurrentInventory(_ machine: MachineManagerable) -> String {
        return machine.checkCurrentInventory().reduce("=> ") {
            $0 + $1.beverageMenu.makeInstance().description + "(" + String($1.quantity) + "개) "
        }
    }
    
    private func viewListOfCurrentBeverage(_ machine: MachineManagerable) -> String {
        var number = 0
        return allMenus.map({
            let beverage = $0.makeInstance()
            number = number + 1
            return String(number) + ") " + beverage.description + " " + String(beverage.price.countChange()) + "원(" +  String(machine.countBeverageQuantity(beverageMenu: $0)) + "개)"
        }).joined(separator: "\n")
    }
}
