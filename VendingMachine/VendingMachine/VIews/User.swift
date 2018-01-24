//
//  User.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct User {
    private let machine: Userable & InventoryCountable
    
    init(_ machine: Userable & InventoryCountable){
        self.machine = machine
    }
    
    func execute() throws {
        guard let arguments = chooseMode() else { throw VendingMachineErrors.incorrectMode }
        
        guard arguments.count >= 1 else { throw VendingMachineErrors.invalidValue }
        guard let action = UserMode(rawValue: Int(arguments[0]) ?? 0) else {
            throw VendingMachineErrors.incorrectMode
        }
        
        switch action {
        case .insertMoney:
            try insertMoney(arguments)
        case .buyBeverage:
            try buyBeverage(arguments)
        }
    }
    
    private func chooseMode() -> [String]? {
        print(MessageMaker().makeUserViewMessage(machine))
        
        guard let answer = readLine() else { return nil }
        let arguments = answer.split(separator: " ").map(String.init)
    
        return arguments
    }

    private func insertMoney(_ arguments: [String]) throws {
        guard isAvailable(arguments.count, base: 2) else { throw VendingMachineErrors.invalidValue }
        try machine.insertMoney(coin: Money(Int(arguments[1]) ?? 0))
    }
    
    private func buyBeverage(_ arguments: [String]) throws {
        guard isAvailable(arguments.count, base: 2) else { throw VendingMachineErrors.invalidValue }
        try machine.buyBeverage(beverageMenu: BeverageMenu.getBeverageMenu(index: Int(arguments[1]) ?? 0 - 1))
    }
    
    private func isAvailable(_ count: Int, base: Int) -> Bool {
        return count >= base
    }
}
