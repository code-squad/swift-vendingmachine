//
//  User.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class User {
    private let machine: Userable & InventoryCountable
    private var isActivated: Bool
    
    init(_ machine: Userable & InventoryCountable){
        self.machine = machine
        self.isActivated = true
    }
    
    func execute() throws -> Bool {
        while isActivated {
            guard let arguments = chooseMode() else { throw VendingMachineErrors.incorrectMode }
            
            guard arguments.count >= 1 else { throw VendingMachineErrors.invalidValue }
            guard let action = UserMode(rawValue: makeIntType(arguments[0])) else {
                throw VendingMachineErrors.incorrectMode
            }
            
            switch action {
            case .insertMoney:
                try insertMoney(arguments)
            case .buyBeverage:
                try buyBeverage(arguments)
            case .exit:
                isActivated = false
            }
        }
        
        return isActivated
    }
    
    private func chooseMode() -> [String]? {
        print(MessageMaker().makeUserViewMessage(machine))
        
        guard let answer = readLine() else { return nil }
        let arguments = answer.split(separator: " ").map(String.init)
    
        return arguments
    }

    private func insertMoney(_ arguments: [String]) throws {
        guard isAvailable(arguments.count, base: 2) else { throw VendingMachineErrors.invalidValue }
        try machine.insertMoney(coin: Money(makeIntType(arguments[1])))
    }
    
    private func buyBeverage(_ arguments: [String]) throws {
        guard isAvailable(arguments.count, base: 2) else { throw VendingMachineErrors.invalidValue }
        try machine.buyBeverage(beverageMenu: BeverageMenu.getBeverageMenu(index: makeIntType(arguments[1])-1))
    }
    
    private func isAvailable(_ count: Int, base: Int) -> Bool {
        return count >= base
    }
    
    private func makeIntType(_ number: String) -> Int {
        let number = Int(number) ?? 0
        return number
    }
}
