//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

let expirationDate = DateFormatter()
expirationDate.dateFormat = "yyyyMMdd"

let beverageSet = BeverageFactory().setBeverage()
let vendingmachine = Vendingmachine.init(beverageSet)
let outputView = OutputView(vendingmachine)
var coin = vendingmachine.checkBalance()
vendingmachine.addBalance(coin)
var vendingmachineController = VendingmachineController.init(vendingmachine, outputView, coin)
let inputView = InputView()



var run = true
while run {
    outputView.showMessages(.start)
    outputView.showMessages(.mode)
    outputView.showInputLine()
    let mode = inputView.inputMode()
    switch mode {
    case 1:
        vendingmachineController.runAdminMode()
    case 2:
        vendingmachineController.runUserMode()
    default: outputView.showMessages(.invalidMenu)
        continue
    }
}




