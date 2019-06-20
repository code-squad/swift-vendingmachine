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
    
    func readInputSubMenu (_ vendingMachine: VendingMachine, _ menu: Menu) throws -> String {
        if menu == .buyDrink {
            try OutputView.printBuyableDrinkList(vendingMachine)
        }
        
        return readLine() ?? "0"
    }
}
