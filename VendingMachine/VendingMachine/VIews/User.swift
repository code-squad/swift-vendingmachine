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
        guard let (action, answer) = chooseMode() else { throw VendingMachineErrors.incorrectMode }
        
        switch action {
        case .insertMoney:
            try machine.insertMoney(coin: Money(answer))
        case .buyBeverage:
            try machine.buyBeverage(beverageMenu: BeverageMenu.getBeverageMenu(index: answer-1))
        }
    }
    
    private func chooseMode() -> (UserMode, Int)? {
        print(MessageMaker().makeUserViewMessage(machine))
        
        guard let answer = readLine() else { return nil }
        let arguments = answer.split(separator: " ").map(String.init)
        
        guard let action = UserMode(rawValue: Int(arguments[0]) ?? 0) else {
            return nil
        }
        
        return (action, Int(arguments[1]) ?? 0)
    }
}
