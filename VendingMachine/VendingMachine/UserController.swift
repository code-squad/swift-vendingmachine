//
//  BeverageBox.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 17..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

struct UserController {
    private var machine: VendingMachineExecute
    private var outputView: OutputView
    init(machine: VendingMachineExecute, view outputView: OutputView) {
        self.machine = machine
        self.outputView = outputView
    }
    
    mutating func executeMachine(inputSelector: [Int]) throws {
        guard inputSelector.count > 1 else {
            throw ErrorCode.validInputString
        }
        switch inputSelector[0] {
        case MenuSelector.insertMode.rawValue:
            machine.insertMoney(inputSelector[1])
            outputView.printAfterInsertMoney()
        case MenuSelector.purchaseMode.rawValue:
            outputView.printAfterBuyingBeverage(beverage: try machine.buyBeverage(number: inputSelector[1]))
            outputView.printAfterInsertMoney()
        default:
            throw ErrorCode.invalidMenu
        }
    }
    
}
