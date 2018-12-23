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
        let input = InputView.readInput(ment: inputMent)
        guard ValidChecker.checkInput(string: input, count: buyableList.count) else {return}
        
        let splitedInput = input.split(separator: " ").map(){Int($0) ?? 0}
        
        if splitedInput[0] == 1 {
            vendingMachine.insert(money: splitedInput[1])
        }
        if splitedInput[0] == 2 {
            let productKeys = Array(vendingMachine.buyableProductList().keys)
            let productKey = productKeys[splitedInput[1] - 1]
            guard let boughtProduct = vendingMachine.buy(productName: productKey) else {return}
            let postPurchaseMent = { (name: String, price: String) -> String in
                return "\(name)를 구매하셨습니다. \(price)를 차감합니다.\n"
            }
//            OutputView.show(result: boughtProduct.beverageInfo(makeInfo: postPurchaseMent))
        }
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

