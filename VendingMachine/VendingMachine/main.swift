//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    let beverages = BeverageGenerator.generateBeverage()
    let beverageInventory = BeverageInventory(stock: beverages)
    let vendingMachine = VendingMachine(inventory: beverageInventory)
    
    let modeInput = InputView.readVendingMachineMode()
    guard let mode = VendingMachineMode.init(rawValue: modeInput) else {
        OutputView.show(failMessage: .invalidInputMessage)
        
        return
    }
    
    switch mode {
    case .managerMode:
        let managerMode = ManagerMode(vendingMachine: vendingMachine)
        managerMode.run()
    case .userMode:
        let userMode = UserMode(vendingMachine: vendingMachine)
        userMode.run()
    }
}

main()
