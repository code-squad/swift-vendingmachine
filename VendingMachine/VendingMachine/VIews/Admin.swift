//
//  Admin.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Admin {
    private let machine: MachineManagerable & InventoryCountable
    private var isActivated: Bool
    
    init(_ machine: MachineManagerable & InventoryCountable) {
        self.machine = machine
        self.isActivated = true
    }
    
    func execute() throws -> Bool {
        while isActivated {
            guard let arguments = chooseMode() else { throw VendingMachineErrors.incorrectMode }
            guard let action = AdminMode(rawValue: makeIntType(arguments[0])) else { throw VendingMachineErrors.invalidValue }
            
            switch action {
            case .addBeverages:
                try addBeverages(arguments)
            case .substractBeverages:
                try substractBeverages(arguments)
            case .salesHistory:
                salesHistory()
            case .exit:
                isActivated = false
            }
        }
        
        return isActivated
    }
    
    private func chooseMode() -> [String]? {
        print(MessageMaker().makeAdminViewMessage(machine))
        
        guard let answer = readLine() else { return nil }
        let arguments = answer.split(separator: " ").map(String.init)
        guard arguments.count > 0 else { return nil }
        
        return arguments
    }
    
    private func addBeverages(_ arguments: [String]) throws {
        guard isAvailable(arguments.count, base: 3) else { throw VendingMachineErrors.invalidValue }
        machine.insertBeverage(beverageMenu: BeverageMenu.getBeverageMenu(index: makeIntType(arguments[1])-1), quantity: makeIntType(arguments[2]))
    }
    
    private func substractBeverages(_ arguments: [String]) throws {
        guard isAvailable(arguments.count, base: 3) else { throw VendingMachineErrors.invalidValue }
        try machine.deductBeverage(beverageMenu: BeverageMenu.getBeverageMenu(index: makeIntType(arguments[1])-1), quantity: makeIntType(arguments[2]))
    }
    
    private func salesHistory() {
        print(MessageMaker().viewSalesHistory(machine))
    }
    
    private func isAvailable(_ count: Int, base: Int) -> Bool {
        return count >= base
    }
    
    private func makeIntType(_ number: String) -> Int {
        let number = Int(number) ?? 0
        return number
    }
}

