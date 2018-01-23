//
//  UserController.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 22..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct UserContorller {
    private var vendingMachine: UserMode
    private var outputViewUser: UserPrintable
    private var runUserMode = true

    init(_ vendingMachineUser: UserMode, _ outputViewUser: UserPrintable) {
        self.vendingMachine = vendingMachineUser
        self.outputViewUser = outputViewUser
    }

    mutating func executeUser() {
        while runUserMode {
            outputViewUser.printUserModeBaseMessages(self.vendingMachine)
            let userInput = inputView.readUserMenu()
            if userInput == .invalidUserMenu {
                outputViewUser.printUserModeMessage(.invalidMenu)
                continue
            }
            guard userInput != .exit else { return }
            self.executeMenu(userInput)
        }
    }

    mutating func executeMenu(_ userInput: InputView.UserMenu) {
        switch userInput {
        case .addMoney :
            outputViewUser.printUserModeMessage(.addMoney)
            vendingMachine.addMoney(inputView.readMoney())
        case .buyDrink :
            vendingMachine.updateProductNumbersAndKinds()
            outputViewUser.printUserModeMessage(.chooseProduct)
            let userProductNumber = inputView.readProductNumber()
            if userProductNumber == .invalidNumber {
                outputViewUser.printUserModeMessage(.invalidMenu)
            }
            let userProductName = vendingMachine.getProductName(userProductNumber)
                ?? ObjectIdentifier(type(of: Beverage.self))
            let userProduct = vendingMachine.generateBeverageFromProductName(userProductName)
            if vendingMachine.generateListOfValidProduct().contains(userProductName) {
                vendingMachine.buy(userProduct
                    ?? Beverage(brand: "", name: "", volume: 0, price: 0, manufacturedDate: Date()))
                outputViewUser.printBuyProduct(userProduct
                    ?? Beverage(brand: "", name: "", volume: 0, price: 0,
                                manufacturedDate: Date()), productPrice: userProduct?.price ?? 0)
                return
            }
            outputViewUser.printUserModeMessage(.shortOfMoney)
        case .exit :
            break
        default :
            break
        }
    }

}
