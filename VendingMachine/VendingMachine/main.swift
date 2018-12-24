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
    while true {
        let buyableList = vendingMachine.buyableProductList()
        let inputMent = MentMaker.makeInputMent(vendingMachineInfo: vendingMachine)
        let inputString = InputView.readInput(ment: inputMent)
        guard ValidChecker.checkInput(string: inputString, count: buyableList.count) else {return}
        let input = VendingMachineInput(input: inputString)
        
        if input.isModeEqual(1) {
            vendingMachine.insert(money: input.readMoney())
        }
        
        if input.isModeEqual(2) {
            let productKeys = Array(buyableList.keys)
            let productKey = input.readKey(keys: productKeys)
            guard let boughtProduct = vendingMachine.buy(productName: productKey) else {return}
            let postPurchaseMent = MentMaker.makePostPurchaseMent(beverage: boughtProduct)
            OutputView.show(result: postPurchaseMent)
        }
        print("")
    }
}

func initializeVendingMachine() -> VendingMachine {
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

