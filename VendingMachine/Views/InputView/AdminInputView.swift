//
//  AdminInputView.swift
//  VendingMachine
//
//  Created by hw on 18/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class AdminInputView {
    static func readAdminInstruction() throws -> Int {
        guard let instruction = readLine() else {
            throw VendingMachineError.invalidMenuSelectNumberError
        }
        let number = try Validation.convertStringToNumber(instruction)
        return number
    }
}
