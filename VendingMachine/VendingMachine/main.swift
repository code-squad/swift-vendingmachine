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
        if let menuContents = vendingMachine.makeMenu() {
            outputView.printMonitor(menuContents: menuContents)
        }
        let inputAction = try inputView.read()
        vendingMachine.action(action: inputAction)
    } catch InputView.InputError.invalidFormat {
        print(InputView.InputError.invalidFormat.rawValue)
    } catch VendingMachine.ModeError.invalidNumber {
        print(VendingMachine.ModeError.invalidNumber.rawValue)
    }
    if let resultOfBuy = vendingMachine.makeResultOfOrder() {
        outputView.printPurchase(drink: resultOfBuy)
    }
}
