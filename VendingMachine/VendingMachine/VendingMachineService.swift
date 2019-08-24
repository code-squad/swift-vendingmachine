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
        vendingMachine.printInventory()

        let selectedNumber = InputView.menuNumber()
        guard let selected = Menu.init(rawValue: selectedNumber) else {
            return
        }
        let value = InputView.readPrompt()
        
        switch selected {
        case .insertMoney:
            vendingMachine.insertMoney(amount: value)
        case .purchaseBeverage:
            let beverage = vendingMachine.inventory[value - 1]
            if let purchased = vendingMachine.purchase(beverage: beverage) {
                purchased.showBeverage(with: OutputView.purchaseForm)
            }
        }
    }

    func insertMoney(amount: Int) {
        vendingMachine.insertMoney(amount: amount)
    }

    func purchaseBeverage(number: Int) -> Bool {
        let beverage = vendingMachine.inventory[number - 1]
        if let purchased = vendingMachine.purchase(beverage: beverage) {
            print("\(purchased)를 구매했습니다.")
            return true
        } else {
            return false
        }
    }
}
