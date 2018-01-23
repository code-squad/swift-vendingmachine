//
//  InputView.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 17..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class InputView {
    enum Mode: Int {
        case admin = 1, user, nothing
    }
    func getMenuInput() -> [Int] {
        if let inputFromUser = readLine() {
            return separateInputValues(input: inputFromUser)
        }
        return [0]
    }
    
    func separateInputValues(input: String) -> [Int] {
        return input.split(separator: " ").map({Int($0) ?? 0})
        
    }
    
    func selectMachineMode() -> Mode {
        if let inputModeNumber = Int(readLine() ?? "") {
            return Mode.init(rawValue: inputModeNumber) ?? .nothing
        }
        return .nothing
    }
    
}
