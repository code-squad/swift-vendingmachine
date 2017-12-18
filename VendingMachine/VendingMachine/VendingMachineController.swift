//
//  BeverageBox.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 17..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

struct VendingMachineController {
    
    static func executeVandingMachine(machine: VendingMachine, inputSelector: [Int]) throws -> VendingMachine {
        var vendingMachine = machine
        guard inputSelector.count > 1 else {
            throw ErrorCode.validInputString
        }
        switch inputSelector[0] {
        case MenuSelector.insertMode.rawValue:
            vendingMachine.insertMoney(inputSelector[1])
            OutputView.printAfterInsertMoney(machine: vendingMachine)
            return vendingMachine
        case MenuSelector.purchaseMode.rawValue:
            OutputView.printAfterBuyingBeverage(beverage: try vendingMachine.buyBeverage(number: inputSelector[1]))
            OutputView.printAfterInsertMoney(machine: vendingMachine)
            return vendingMachine
        default:
            throw ErrorCode.invalidMenu
        }
    }
    
}
