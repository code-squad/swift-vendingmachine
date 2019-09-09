//
//  InputView.swift
//  VendingMachine
//
//  Created by CHOMINJI on 17/08/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    static func readMenu() -> Int {
        for menu in Menu.allCases {
            print(menu)
        }
        let input = readPrompt()
        return input
    }
    
    static func readMode() -> Int {
        for mode in Mode.allCases {
            print(mode)
        }
        let input = readPrompt()
        return input
    }
    
    static func readPrompt() -> Int {
        let inputSymbol = ">"
        print(inputSymbol, terminator: " ")
        let prompt = readLine() ?? ""
        return Int(prompt) ?? -1
    }
}
