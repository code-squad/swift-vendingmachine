//
//  InputView.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/19/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    static func readInputToMenu (_ vendingMachine: VendingMachine) -> String {
        let menu: String
        
        OutputView.printMenuInputGuidance(vendingMachine)
        menu = readLine() ?? "0"
        
        return menu
    }

    static func readInputToInt () -> Int {
        let input = readLine() ?? "0"
        
        return Int(input) ?? 0
    }
}
