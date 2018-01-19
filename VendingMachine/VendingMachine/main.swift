//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() throws {
    let vendingMachine = VendingMachine(money: Money(), inventory: Inventory())
    vendingMachine.supply(3)
    
    while true {
        do {
            guard let (mode, answer) = try InputView(vendingMachine: vendingMachine).chooseAction() else { break }
            try OutputView(vendingMachine: vendingMachine).printResult(input: (mode, answer))
        } catch let e as BeverageErrors {
            print(e.localizedDescription)
        }
    }
}

try main()

