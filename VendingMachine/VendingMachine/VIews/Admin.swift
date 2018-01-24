//
//  Admin.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Admin {
    private let machine: MachineManagerable & InventoryCountable
    
    init(_ machine: MachineManagerable & InventoryCountable){
        self.machine = machine
    }
    
    func execute() throws {
        guard let (action, answer, quantity) = chooseMode() else { throw VendingMachineErrors.incorrectMode }
        
        switch action {
        case .addBeverages:
            machine.insertBeverage(beverageMenu: BeverageMenu.getBeverageMenu(index: answer-1), quantity: quantity)
        case .substractBeverages:
            try machine.deductBeverage(beverageMenu: BeverageMenu.getBeverageMenu(index: answer-1), quantity: quantity)
        }
    }
    
    private func chooseMode() -> (AdminMode, Int, Int)? {
        print(MessageMaker().makeAdminViewMessage(machine))
        
        guard let answer = readLine() else { return nil }
        let arguments = answer.split(separator: " ").map(String.init)
        
        guard let action = AdminMode(rawValue: Int(arguments[0]) ?? 0) else { return nil }
        
        return (action, Int(arguments[1]) ?? 0, Int(arguments[2]) ?? 0)
    }
}

