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
let adminOutputView = AdminOutputView(vendingmachine)
let userOutputView = UserOutputView(vendingmachine)
let adminController = AdminController(vendingmachine, adminOutputView)
var userController = UserController.init(vendingmachine, userOutputView)
let inputView = InputView()

var coin = vendingmachine.checkBalance()
vendingmachine.addBalance(coin)

var run = true
while run {
    adminOutputView.showMessages(.start)
    adminOutputView.showMessages(.mode)
    adminOutputView.showInputLine()
    let mode = inputView.inputMode()
    switch mode {
    case 1:
        adminController.runAdminMode()
    case 2:
        userController.runUserMode()
    default: adminOutputView.showMessages(.invalidMenu)
        continue
    }
}




