//
//  AdminController.swift
//  VendingMachine
//
//  Created by Eunjin Kim on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class AdminController {
    
    static func adminMode(vendingMachine: VendingMachine) {
        let inputView = InputView()
        let adminOutputView = AdminOutputView()
        var isAdminModeContinue = true
        repeat {
            var entireInventory = vendingMachine.showEntireInventory()
            adminOutputView.printBeverageMenu(entireInventory: entireInventory)
            adminOutputView.printInventoryUseMenu()
            let inputValue = inputView.getMenuInput()
            let choiceBeverage = vendingMachine.choiceBeverageData(number: inputValue[1])
            switch inputValue[0] {
            case 1:
                vendingMachine.addInInventory(beverageName: choiceBeverage, number: inputValue[2])
                adminOutputView.printAddInventory(choiceBeverage: choiceBeverage, number: inputValue[2])
            case 2:
                vendingMachine.deleteInventory(beverageName: choiceBeverage, number: inputValue[2])
                adminOutputView.printDeleteInventory(choiceBeverage: choiceBeverage, number: inputValue[2])
            case -1:
                isAdminModeContinue = false;
            default: break
            }
            entireInventory = vendingMachine.showEntireInventory()
            adminOutputView.printBeverageMenu(entireInventory: entireInventory)
        } while isAdminModeContinue
    }
}
