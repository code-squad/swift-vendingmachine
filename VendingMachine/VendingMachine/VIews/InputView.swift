//
//  InputView.swift
//  VendingMachine
//
//  Created by yuaming on 2018. 1. 19..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct InputView {    
    static func chooseAction(_ message: String) throws -> (ScreenHelper.Mode, Int)? {
        print(message)
        
        guard let action = readLine() else { throw VendingMachineErrors.invalidValue }

        return try answer(action)
    }

    static func answer(_ action: String) throws -> (ScreenHelper.Mode, Int)? {
        let arguments = action.split(separator: " ")

        if arguments[0] == "q" || arguments[0] == "quit" { return nil }
        guard arguments.count >= 2 else { throw VendingMachineErrors.invalidValue }
        guard let mode = ScreenHelper.Mode(rawValue: Int(arguments[0]) ?? 0) else { throw VendingMachineErrors.invalidValue }

        return (mode, Int(arguments[1]) ?? 0)
    }
}
