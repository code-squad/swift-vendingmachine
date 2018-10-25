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
        let result: (menu: T, rawValue: String?) = try readRawInput(type: type)
        return result.menu
    }
    
    static func readUserInput() throws -> (UserMenu, Int) {
        print(UserMenu.description, terminator: "")
        return try read(type: UserMenu.self)
    }
    
    static func read<T: RawRepresentable>(type: T.Type) throws -> (T, Int) where T.RawValue == String {
        let result: (menu: T, rawValue: String?) = try readRawInput(type: type)
        guard let rawValue = result.rawValue, let value = Int(rawValue) else { throw VendingMachineError.wrongInput }
        return (result.menu, value)
    }
    
    private static func readRawInput<T: RawRepresentable>(type: T.Type) throws -> (menu: T, rawValue: String?) where T.RawValue == String{
        guard let rawInput = readLine() else { throw VendingMachineError.wrongInput }
        let parsed = rawInput.split(separator: " ").map { String($0) }
        guard let rawMenu = parsed.first, let menu = T(rawValue: rawMenu) else { throw VendingMachineError.wrongInput }
        let rawValue: String? = parsed.count == 2 ? parsed.last : nil
        return (menu, rawValue)
    }
    
    static func read() throws -> Int {
        guard let rawValue = readLine(), let index = Int(rawValue) else { throw VendingMachineError.wrongInput }
        return index
    }
}
