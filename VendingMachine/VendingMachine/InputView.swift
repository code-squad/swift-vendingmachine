//
//  InputView.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 17..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class InputView {
    
    func getMenuInput() -> [Int] {
        if let inputFromUser = readLine() {
            return separateInputValues(input: inputFromUser)
        }
        return [0]
    }
    
    func separateInputValues(input: String) -> [Int] {
        return input.split(separator: " ").map({Int($0) ?? 0})
    }
    
    func selectMachineMode() -> Int {
        if let inputModeNumber = Int(readLine() ?? "") {
            return inputModeNumber
        }
        return 0
    }
    
}
