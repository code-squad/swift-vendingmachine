//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

var controller = Controller()

while true {
    if controller.isModeSelected == false {
        if let selectedMode = InputView.read() {
            controller.selectMode(menuNum: selectedMode)
        }
    }
    guard let menu = controller.makeMenu() else {
        continue
    }
    Outputview.printMonitor(mode: menu.mode, money: menu.money, menu: menu.menu, inventory: menu.inventory)
    guard let inputAction = InputView.readMenu() else {
        Outputview.printError(error: InputView.PreGameMessage.invalidMenu)
        continue
    }
    do {
        try controller.action(action: inputAction.menuOption, detail: inputAction.detail)
    } catch  let error {
        Outputview.printError(error: error)
    }
    if let resultOfBuy = controller.makeResultOfOrder() {
        Outputview.printPurchase(drink: resultOfBuy)
    }
}
