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
    
    vendingMachineLoop: while true {
        switch mode {
        case .managerMode:
            let managerMode = vendingMachine as VendingMachineManagerable & Printable
            
            managerMode.showInventory(form: OutputView.showInventory)
            
            let menuInput = InputView.readManagerMenu()
            guard let menu = ManagerMenu.init(rawValue: menuInput) else {
                OutputView.show(failMessage: .invalidInputMessage)
                
                continue vendingMachineLoop
            }
            
            let input = InputView.readInput()
            let beverage = managerMode.fetchProduct(at: input)
            
            switch menu {
            case .addStock:
                managerMode.addStock(beverage)
            case .removeStock:
                managerMode.removeStock(beverage)
            }
            
        case .userMode:
            let userMode = vendingMachine as VendingMachineUserable & Printable
            
            userMode.showBalance(form: OutputView.showBalance)
            userMode.showInventory(form: OutputView.showInventory)
            
            let menuInput = InputView.readUserMenu()
            guard let menu = UserMenu.init(rawValue: menuInput) else {
                OutputView.show(failMessage: .invalidInputMessage)
                
                continue vendingMachineLoop
            }
            
            let input = InputView.readInput()
            
            switch menu {
            case .insertMoney:
                if !userMode.insert(money: input) {
                    OutputView.show(failMessage: .invalidInputMessage)
                    
                    continue vendingMachineLoop
                }
            case .purchaseBeverage:
                guard let beverage = userMode.purchaseProduct(index: input) else {
                    OutputView.show(failMessage: .unableToPurchaseMessage)
                    
                    continue vendingMachineLoop
                }
                
                OutputView.showPurchase(beverage)
            }
        }
    }
}

main()
