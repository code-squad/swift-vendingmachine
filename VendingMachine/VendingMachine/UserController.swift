//
//  UserController.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct UserContorller {
    private var vendingMachine : UserMode
    private var runUserMode = true

    
    init(_ vendingMachineUser : UserMode) {
        self.vendingMachine = vendingMachineUser
    }
    
    mutating func executeUser() {
        while runUserMode {
        outputView.printUserModeBaseMessages(self.vendingMachine)
            let userInput = inputView.readUserMenu()
            if userInput == .invalidUserMenu {
                outputView.printUserModeMessage(.invalidMenu)
                continue
            }
            guard userInput != .exit else { return }
            self.executeMenu(userInput)
        }
    }
    
    mutating func executeMenu(_ userInput : InputView.UserMenu) {
        switch userInput {
        case .addMoney :
            outputView.printUserModeMessage(.addMoney)
            vendingMachine.addMoney(inputView.readMoney())
        case .buyDrink :
            vendingMachine.updateProductNumbersAndKinds()
            outputView.printUserModeMessage(.chooseProduct)
            let userProductNumber = inputView.readProductNumber()
            if userProductNumber == .invalidNumber {
                outputView.printUserModeMessage(.invalidMenu)
            }
            let userProductName = vendingMachine.getProductName(userProductNumber)
            let userProduct = vendingMachine.getInventory()[userProductName]?.first
            if vendingMachine.generateListOfValidProduct().contains(userProductName) {
                vendingMachine.buy(userProductName)
                outputView.printBuyProduct(userProductName, productPrice: userProduct?.price ?? 0)
                return
            }
            outputView.printUserModeMessage(.shortOfMoney)
        case .exit :
        break
        default :
            break
        }
    }
    
}
