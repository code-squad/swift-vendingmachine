//
//  InputView.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/10/28.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    static func readVendingMachineMode() -> Int {
        VendingMachineMode.allCases.forEach { print($0) }
        
        return readInput()
    }
    
    static func readUserMenu() -> Int {
        UserMenu.allCases.forEach { print($0) }
        
        return readInput()
    }
    
    static func readInput() -> Int {
        let input = readLine() ?? ""
        
        return Int(input) ?? -1
    }
}
