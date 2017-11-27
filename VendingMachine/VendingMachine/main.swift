//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

var vendingMachine = VendingMachine()
var inputView = InputView()
let outputView = Outputview()

while(true) {
    do {
        if !vendingMachine.hasMode {
            let mode = try inputView.readMode()
            try vendingMachine.assignMode(mode: mode)
        }
        if let menu = vendingMachine.makeMenu() {
            outputView.printMonitor(mode: menu.mode, money:menu.money, menu: menu.menu, inventory: menu.inventory)
        }
        let input = try inputView.read()
        try vendingMachine.action(option: input.option, detail: input.detail)
        if let resultOfAction = vendingMachine.makeResultOfOrder() {
            outputView.printPurchase(drink: resultOfAction)
        }
    } catch InputView.InputError.invalidFormat {
        print(InputView.InputError.invalidFormat.rawValue)
    } catch CoreVendingMachine.stockError.soldOut {
        print(CoreVendingMachine.stockError.soldOut.rawValue)
    } catch CoreVendingMachine.stockError.invalidProductNumber {
        print(CoreVendingMachine.stockError.invalidProductNumber.rawValue)
    } catch CoreVendingMachine.stockError.empty {
        print(CoreVendingMachine.stockError.empty.rawValue)
    } catch VendingMachine.ModeError.invalidNumber {
        print(VendingMachine.ModeError.invalidNumber.rawValue)
    }
}
