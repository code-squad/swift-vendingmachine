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
        let input = InputView.readInput(ment: "자판기를 시작합니다.\n1. 관리자 모드\n2. 사용자 모드\n> ")
        if VendingMachineMode.manager.isEqual(input: input) {
            guard let returnedVendingMachine = VendingMachineManagerMode.run(vendingMachine) else {return}
            vendingMachine = returnedVendingMachine
        }
        if VendingMachineMode.user.isEqual(input: input) {
            guard let returnedVendingMachine = VendingMachineUserMode.run(vendingMachine) else {return}
            vendingMachine = returnedVendingMachine
        }
    }
}

private func initializeVendingMachine() -> VendingMachine {
    var vendingMachine = VendingMachine()

    let mandarineMilk = MandarineMilk()
    let lactoseFreeMilk = LactoseFreeMilk()
    let starbucksDoubleShot = StarbucksDoubleShot()
    let topTheBlack = TOPTheBlack()
    let cocaCola = CocaCola()
    let cocaColaZero = CocaColaZero()

    vendingMachine.add(product: mandarineMilk)
    vendingMachine.add(product: lactoseFreeMilk)
    vendingMachine.add(product: lactoseFreeMilk)
    vendingMachine.add(product: cocaCola)
    vendingMachine.add(product: cocaCola)
    vendingMachine.add(product: cocaCola)
    vendingMachine.add(product: starbucksDoubleShot)
    vendingMachine.add(product: starbucksDoubleShot)
    vendingMachine.add(product: topTheBlack)
    vendingMachine.add(product: cocaColaZero)

    return vendingMachine
}

main()
