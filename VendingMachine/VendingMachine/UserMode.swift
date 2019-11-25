//
//  UserMode.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/11/25.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

struct UserMode {
    let vendingMachine: VendingMachine
    
    func run() {
        while true {
            let userMode = vendingMachine as VendingMachineUserable & Printable
            
            userMode.showBalance(form: OutputView.showBalance)
            userMode.showInventory(form: OutputView.showInventory)
            
            let menuInput = InputView.readUserMenu()
            guard let menu = UserMenu.init(rawValue: menuInput) else {
                OutputView.show(failMessage: .invalidInputMessage)
                
                continue
            }
            
            let input = InputView.readInput()
            
            switch menu {
            case .insertMoney:
                if !userMode.insert(money: input) {
                    OutputView.show(failMessage: .invalidInputMessage)
                    
                    continue
                }
            case .purchaseBeverage:
                guard let beverage = userMode.purchaseProduct(index: input) else {
                    OutputView.show(failMessage: .unableToPurchaseMessage)
                    
                    continue
                }
                
                OutputView.showPurchase(beverage)
            }
        }
    }
}
