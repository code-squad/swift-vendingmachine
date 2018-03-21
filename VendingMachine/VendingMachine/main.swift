//
//  main.swift
//  VendingMachine
//
//  Created by JK on 11/10/2017.
//  Copyright © 2017 JK. All rights reserved.
//

import Foundation

var controller = Controller()
var inputView = InputView()
let outputView = Outputview()

while true {
    guard let selectedMode = InputView.read() else {
        print("올바른 메뉴번호를 입력해주세요.")
        continue
    }
    do {
        try controller.selectMode(menuNum: selectedMode)
    } catch Controller.ModeError.invalidNumber {
        print(Controller.ModeError.invalidNumber.rawValue)
        continue
    }
    if let menu = controller.makeMenu() {
        outputView.printMonitor(mode: menu.mode, money: menu.money, menu: menu.menu, inventory: menu.inventory)
    }
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


