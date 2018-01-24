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
        guard let arguments = chooseMode() else { throw VendingMachineErrors.incorrectMode }
        guard let action = AdminMode(rawValue: Int(arguments[0]) ?? 0) else { throw VendingMachineErrors.invalidValue }
        
        switch action {
        case .addBeverages:
            try addBeverages(arguments)
        case .substractBeverages:
            try substractBeverages(arguments)
        }
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
        machine.insertBeverage(beverageMenu: BeverageMenu.getBeverageMenu(index: Int(arguments[1]) ?? 0 - 1), quantity: Int(arguments[2]) ?? 0)
    }
    
    private func substractBeverages(_ arguments: [String]) throws {
        guard isAvailable(arguments.count, base: 3) else { throw VendingMachineErrors.invalidValue }
        try machine.deductBeverage(beverageMenu: BeverageMenu.getBeverageMenu(index: Int(arguments[1]) ?? 0 - 1), quantity: Int(arguments[2]) ?? 0)
    }
    
    private func isAvailable(_ count: Int, base: Int) -> Bool {
        return count >= base
    }
}

