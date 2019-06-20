//
//  InputView.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/19/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct InputView {
    func readInput (_ vendingMachine: VendingMachine) -> String {
        let menu: String
        
        OutputView.printMenuInputGuidance(vendingMachine)
        menu = readLine() ?? "0"
        
        return menu
    }

    static func readInputToCoin () -> Int {
        let coin = readLine() ?? "0"
        
        return Int(coin) ?? 0
    }
    
    static func readInputToDrinkIndex () -> Int {
        let index = readLine() ?? "0"
        
        return Int(index) ?? 0
    }
}
