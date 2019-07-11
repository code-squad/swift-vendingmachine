//
//  InputView.swift
//  VendingMachine
//
//  Created by hw on 09/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class InputView {
    static func readInstruction() throws -> (instruction: Int, quantity: Int) {
        guard let instruction = readLine() else {
            throw VendingMachineError.invalidMenuSelectNumberError
        }
        let numberArray : [Int] = try instruction.components(separatedBy: " ").map({ (value) in
            return try Validation.convertStringToNumber(value)
        })
        if !Validation.isValidInputPair(numberArray) {
            throw VendingMachineError.invalidInputNumbers
        }
        return (numberArray[0], numberArray[1])
    }
}
