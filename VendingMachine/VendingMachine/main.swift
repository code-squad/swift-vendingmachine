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
    let balanceMent = "현재 투입한 금액이 \(vendingMachine.checkBalance())원입니다. 다음과 같은 음료가 있습니다.\n"
    var inventoryCatalog = "=>"
    for (name, count) in vendingMachine.checkInventory() {
        inventoryCatalog += " \(name)(\(count)개)"
    }
    let selectMent = "\n1. 금액추가\n2. 음료구매\n> "
    InputView.readInput(ment: balanceMent+inventoryCatalog+selectMent)
    
    
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

