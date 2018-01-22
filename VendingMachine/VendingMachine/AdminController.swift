//
//  AdminController.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct AdminController {
    private var vendingMachine : AdminMode
    private var outputViewAdmin : AdminPrintable
    private var runAdminMode = true

    
    init(_ vendingMachineAdmin : AdminMode, _ outputViewAdmin : AdminPrintable) {
        self.vendingMachine = vendingMachineAdmin
        self.outputViewAdmin = outputViewAdmin
    }
    
    mutating func executeAdmin() {
        while runAdminMode {
        outputViewAdmin.printAdminModeBaseMessages(self.vendingMachine)
            let adminInput = inputView.readAdminMenu()
            if adminInput == .invalidAdminMenu {
                outputViewAdmin.printAdminModeMessage(.invalidMenu)
                continue
            }
            guard adminInput != .exit else { return }
            self.executeMenu(adminInput)
        }
    }
    
    mutating func executeMenu(_ adminInput : InputView.AdminMenu) {
        switch adminInput {
        case .addProduct :
            vendingMachine.updateProductNumbersAndKinds()
            outputViewAdmin.printAdminModeMessage(.addProduct)
            let adminProductNumber = inputView.readProductNumber()
            if adminProductNumber == .invalidNumber {
                outputViewAdmin.printAdminModeMessage(.invalidMenu)
                return
            }
            let adminProductName = vendingMachine.getProductName(adminProductNumber)
            let adminProduct = vendingMachine.generateBeverageFromProductName(adminProductName)
            guard let oneProduct = adminProduct else { return }
            if vendingMachine.generateListOfProduct().contains(adminProductName) {
                vendingMachine.addBeverage(oneProduct)
                outputViewAdmin.printAdminModeMessage(.addProduct)
                return
            }
            outputViewAdmin.printAdminModeMessage(.invalidMenu)
        case .removeProduct :
            vendingMachine.updateProductNumbersAndKinds()
            outputViewAdmin.printAdminModeMessage(.removeProduct)
            let adminProductNumber = inputView.readProductNumber()
            if adminProductNumber == .invalidNumber {
                outputViewAdmin.printAdminModeMessage(.invalidMenu)
            }
            let adminProductName = vendingMachine.getProductName(adminProductNumber)
            if vendingMachine.generateListOfProduct().contains(adminProductName) {
                vendingMachine.removeProduct(adminProductName)
                outputViewAdmin.printAdminModeMessage(.removeProduct)
                return
            }
            outputViewAdmin.printAdminModeMessage(.noProduct)
        case .history :
            print(vendingMachine.generateListOfHistory())
        case .exit :
            break
        default : break
        }
    }
    
}
