//
//  InputView.swift
//  VendingMachine
//
//  Created by 이동건 on 18/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class InputView {
    static func read<T: Discriptable>(type: T.Type) throws -> T where T.RawValue == String {
        print(T.description, terminator: "")
        guard let rawValue = readLine() else { throw VendingMachineError.wrongInput }
        guard let menu = T(rawValue: rawValue) else { throw VendingMachineError.wrongInput }
        return menu
    }
    
    static func readUserInput() throws -> (UserMenu, Int) {
        print(UserMenu.description, terminator: "")
        return try read(type: UserMenu.self)
    }
    
    static func read<T: RawRepresentable>(type: T.Type) throws -> (T, Int) where T.RawValue == String {
        guard let rawValue = readLine() else { throw VendingMachineError.wrongInput }
        
        let parsed = rawValue.split(separator: " ").map { String($0) }
        
        guard let first = parsed.first,let menu = T(rawValue: first) else {
            throw VendingMachineError.wrongInput
        }
        guard let second = parsed.last, let value = Int(second) else {
            throw VendingMachineError.wrongInput
        }
        
        return (menu, value)
    }
    
    static func read() throws -> Int {
        guard let rawValue = readLine(), let index = Int(rawValue) else { throw VendingMachineError.wrongInput }
        return index
    }
}
