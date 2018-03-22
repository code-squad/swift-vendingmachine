//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

var controller = Controller()
let outputView = Outputview()

while true {
    if controller.isModeSelected == false {
        if let selectedMode = InputView.read() {
            controller.selectMode(menuNum: selectedMode)
        }
    }
    guard let menu = controller.makeMenu() else {
        continue
    }
    outputView.printMonitor(mode: menu.mode, money: menu.money, menu: menu.menu, inventory: menu.inventory)
    guard let inputAction = InputView.readMenu() else {
        print("올바른 번호를 입력해주세요.")
        continue
    }
    do {
        try controller.action(action: inputAction.menuOption, detail: inputAction.detail)
    } catch  let error {
        print(error)
    }
    if let resultOfBuy = controller.makeResultOfOrder() {
        outputView.printPurchase(drink: resultOfBuy)
    }
}
