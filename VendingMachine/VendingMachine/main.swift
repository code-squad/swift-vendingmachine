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
var connector = Connector()
while(true) {
    do {
        if !connector.hasMode {
            let mode = try inputView.readMode()
            try connector.assignMode(target: vendingMachine, mode: mode)
        }
        if let menu = connector.makeMenu() {
            outputView.printMonitor(mode: menu.mode, money:menu.money, menu: menu.menu, inventory: menu.inventory)
        }
        let input = try inputView.read()
        try connector.action(option: input.option, detail: input.detail)
        if let resultOfAction = connector.makeResultOfOrder() {
            outputView.printPurchase(drink: resultOfAction)
        }
    } catch InputView.InputError.invalidFormat {
        print(InputView.InputError.invalidFormat.rawValue)
    } catch VendingMachine.stockError.soldOut {
        print(VendingMachine.stockError.soldOut.rawValue)
    } catch VendingMachine.stockError.invalidProductNumber {
        print(VendingMachine.stockError.invalidProductNumber.rawValue)
    } catch VendingMachine.stockError.empty {
        print(VendingMachine.stockError.empty.rawValue)
    } catch VendingMachine.ModeError.invalidNumber {
        print(VendingMachine.ModeError.invalidNumber.rawValue)
    }
}
