//
//  main.swift
//  VendingMachine
//
//  Created by Jack (2018/01/15)
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let form = DateFormatter()
form.dateFormat = "yyyyMMdd"

let baseProductsBox = [StrawberryMilk(),StrawberryMilk(),StrawberryMilk(),BananaMilk(),BananaMilk(),BananaMilk(),PepciCoke(),PepciCoke(),PepciCoke(),PepciCoke(),PepciCoke(),Fanta(),Fanta(),Fanta(),TOPCoffee(),TOPCoffee(),TOPCoffee(),Georgia(),Georgia()]

var vendingMachine = VendingMachine(productsBox: baseProductsBox)
var runVendingMachine : Bool = true
let inputView : InputView = InputView()
let outputView : OutputView = OutputView()
while runVendingMachine {
    
    outputView.printBaseMessages(vendingMachine)
    let userInput = inputView.readMenu()
    if userInput == .invalidMenu {
        outputView.printMessage(.invalidMenu)
        continue
    }
    guard userInput != .exit else { break }
    
    switch userInput {
    case .addMoney :
        outputView.printMessage(.addMoney)
        vendingMachine.addMoney(inputView.readMoney())
    case .buyDrink :
        vendingMachine.updateProductNumbersAndKinds()
        outputView.printMessage(.chooseProduct)
        let userProductNumber = inputView.readProductNumber()
        if userProductNumber == .invalidNumber  {
            outputView.printMessage(.invalidMenu)
        }
        let userProductName = vendingMachine.getProductNumbersAndKinds()[userProductNumber.rawValue] ?? ""
        let userProduct = vendingMachine.getInventory()[userProductName]?.first
        if vendingMachine.generateListOfValidProduct().contains(userProductName) {
            vendingMachine.buy(userProductName)
            outputView.printBuyProduct(userProductName, productPrice: userProduct?.price ?? 0)
            continue
        }
        outputView.printMessage(.shortOfMoney)
    case .history :
        print(vendingMachine.generateListOfHistory())
    default :
        break
    }
}



