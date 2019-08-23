////
////  VendingMachineService.swift
////  VendingMachine
////
////  Created by CHOMINJI on 22/08/2019.
////  Copyright © 2019 JK. All rights reserved.
////

import Foundation

class VendingMachineService {
    let vendingMachine: VendingMachine

    init(vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
    }

    let menuTable = [Menu.insertMoney: insertMoney,
                     Menu.purchaseBeverage: purchaseBeverage]

    func selectMenu() {
        vendingMachine.showBalance(with: OutputView.balanceForm)
        vendingMachine.printStock()

        let selectedNumber = InputView.menuNumber()
        guard let selected = Menu.init(rawValue: selectedNumber) else {
            return
        }
        if let selectedMenu = menuTable[selected] {
            let value = InputView.readPrompt()
            selectedMenu(self)(value)
        }
    }

    func insertMoney(amount: Int) {
        vendingMachine.insertMoney(amount: amount)
    }

    func purchaseBeverage(number: Int) {
        let beverage = vendingMachine.inventory[number - 1]
        let purchased = vendingMachine.purchase(beverage: beverage)
    }
}
