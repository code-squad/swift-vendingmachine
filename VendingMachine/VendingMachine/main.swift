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
        let inputMent = MentMaker.makeInputMent(vendingMachineInfo: vendingMachine)
        let input = InputView.readInput(ment: inputMent)
//        guard ValidChecker.checkInputOfInsertMoney(string: input) else {return}
        
        let splitedInput = input.split(separator: " ").map(){Int($0) ?? 0}
        
        if splitedInput[0] == 1 {
            vendingMachine.insert(money: splitedInput[1])
        }
        if splitedInput[0] == 2 {
            let productKeys = Array(vendingMachine.buyableProducts().keys)
            let productKey = productKeys[splitedInput[1] - 1]
            let boughtProduct = vendingMachine.buy(productName: productKey)
            
        }
        print("")
    }
}

func initializeVendingMachine() -> VendingMachine {
    var VM = VendingMachine()
    
    let mandarineMilk = MandarineMilk(openDate: Date(before: 13))
    let lactoseFreeMilk = LactoseFreeMilk(openDate: Date(before: 20))
    let starbucksDoubleShot = StarbucksDoubleShot(openDate: Date(before: 6))
    let topTheBlack = TOPTheBlack(openDate: Date(before: 7))
    let cocaCola = CocaCola(openDate: Date(before: 4))
    let cocaColaZero = CocaColaZero(openDate: Date(before: 9))
    
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

