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
    private var runAdminMode = true

    
    init(_ vendingMachineAdmin : AdminMode) {
        self.vendingMachine = vendingMachineAdmin
    }
    
    mutating func executeAdmin() {
        while runAdminMode {
        outputView.printAdminModeBaseMessages(self.vendingMachine)
            let adminInput = inputView.readAdminMenu()
            if adminInput == .invalidAdminMenu {
                outputView.printAdminModeMessage(.invalidMenu)
                continue
            }
            guard adminInput != .exit else { return }
            self.executeMenu(adminInput)
        }
    }
    
    mutating func executeMenu(_ adminInput : InputView.adminMenu) {
        switch adminInput {
        case .addProduct :
            vendingMachine.updateProductNumbersAndKinds()
            outputView.printAdminModeMessage(.addProduct)
            let adminProductNumber = inputView.readProductNumber()
            if adminProductNumber == .invalidNumber {
                outputView.printAdminModeMessage(.invalidMenu)
                return
            }
            let adminProductName = vendingMachine.getProductName(adminProductNumber)
            let adminProduct = vendingMachine.generateBeverageFromProductName(adminProductName)
            guard let oneProduct = adminProduct else { return }
            if vendingMachine.generateListOfValidProduct().contains(adminProductName) {
                vendingMachine.addBeverage(oneProduct)
                outputView.printAdminModeMessage(.addProduct)
                return
            }
            outputView.printAdminModeMessage(.invalidMenu)
        case .removeProduct :
            vendingMachine.updateProductNumbersAndKinds()
            outputView.printAdminModeMessage(.removeProduct)
            let adminProductNumber = inputView.readProductNumber()
            if adminProductNumber == .invalidNumber {
                outputView.printAdminModeMessage(.invalidMenu)
            }
            let adminProductName = vendingMachine.getProductName(adminProductNumber)
            if vendingMachine.generateListOfValidProduct().contains(adminProductName) {
                vendingMachine.removeProduct(adminProductName)
                outputView.printAdminModeMessage(.removeProduct)
                return
            }
            outputView.printAdminModeMessage(.noProduct)
        case .history :
            print(vendingMachine.generateListOfHistory())
        case .exit :
            break
        default : break
        }
    }
    
}
