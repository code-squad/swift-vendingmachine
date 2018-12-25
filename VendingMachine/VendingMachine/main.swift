//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

func main() {
    var vendingMachine = initializeVendingMachine()
    let startMent = MentMaker.makeStartMent()
    while true {
        let input = InputView.readInput(ment: startMent)
        if VendingMachineMode.userMode.rawValue == input {
            guard let returnedVendingMachine = userMode(vendingMachineOfUserMode: vendingMachine) else {return}
            vendingMachine = returnedVendingMachine
        }
    }
}

private func userMode(vendingMachineOfUserMode: VendingMachineUserFunction) -> VendingMachine? {
    var vendingMachine = vendingMachineOfUserMode
    while true {
        let buyableList = vendingMachine.buyableProductList()
        let inputMent = MentMaker.makeInputMent(vendingMachineInfo: vendingMachine)
        let inputString = InputView.readInput(ment: inputMent)
        if inputString == "3" {
            guard let vendingMachine = vendingMachine as? VendingMachine else {return nil}
            return vendingMachine
        }
        guard ValidChecker.checkInput(string: inputString, count: buyableList.count) else {return nil}
        let input = VendingMachineInput(input: inputString)
        
        if input.isModeEqual(1) {
            vendingMachine.insert(money: input.readMoney())
        }
        
        if input.isModeEqual(2) {
            let productKeys = Array(buyableList.keys)
            let productKey = input.readKey(keys: productKeys)
            guard let boughtProduct = vendingMachine.buy(productName: productKey) else {return nil}
            let postPurchaseMent = MentMaker.makePostPurchaseMent(beverage: boughtProduct)
            OutputView.show(result: postPurchaseMent)
        }
        print("")
    }
}

private func initializeVendingMachine() -> VendingMachine {
    var VM = VendingMachine()
    
    let mandarineMilk = MandarineMilk()
    let lactoseFreeMilk = LactoseFreeMilk()
    let starbucksDoubleShot = StarbucksDoubleShot()
    let topTheBlack = TOPTheBlack()
    let cocaCola = CocaCola()
    let cocaColaZero = CocaColaZero()
    
    VM.add(product: mandarineMilk)
    VM.add(product: lactoseFreeMilk)
    VM.add(product: lactoseFreeMilk)
    VM.add(product: cocaCola)
    VM.add(product: cocaCola)
    VM.add(product: cocaCola)
    VM.add(product: starbucksDoubleShot)
    VM.add(product: starbucksDoubleShot)
    VM.add(product: topTheBlack)
    VM.add(product: cocaColaZero)
    
    return VM
}

main()

