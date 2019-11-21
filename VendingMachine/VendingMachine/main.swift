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
    
    gameLoop: while true {
        vendingMachine.showBalance(form: OutputView.showBalance)
        vendingMachine.showInventory(form: OutputView.showInventory)
        
        let menuInput = InputView.readUserMenu()
        guard let menu = UserMenu.init(rawValue: menuInput) else {
            OutputView.show(failMessage: .invalidInputMessage)
            
            continue gameLoop
        }
        
        let input = InputView.readInput()
        
        switch menu {
        case .insertMoney:
            if !vendingMachine.insert(money: input) {
                OutputView.show(failMessage: .invalidInputMessage)
                
                continue gameLoop
            }
        case .purchaseBeverage:
            guard let beverage = vendingMachine.purchaseProduct(index: input) else {
                OutputView.show(failMessage: .unableToPurchaseMessage)
                
                continue gameLoop
            }
            
            OutputView.showPurchase(beverage)
        }
    }
}

main()
